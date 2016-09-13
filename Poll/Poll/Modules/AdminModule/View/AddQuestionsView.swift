//
//  AddQuestionsView.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import PKHUD
class AddQuestionsView: UIViewController, UITextFieldDelegate, SetupViewProtocol, AddChoiceProtocol {
  
  static let kStoryboradName = "AddQuestionsView"
  static let kReuseIdentifier = "AddChoiceItemCell"
  
  @IBOutlet weak var questionTextField: UITextField!
  @IBOutlet weak var addQuestionButton: AnimationButton!
  @IBOutlet weak var tableView: UITableView!
  
  var choices: [String]?
  weak var delegate: AddQuestionProtocol?
  override func viewDidLoad() {
    super.viewDidLoad()
    
    configureView()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    
    return 2
  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 1 {
      return 1
    }
    return choices?.count ?? 0
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCellWithIdentifier(AddChoiceTableViewCell.kReuseIdentifier, forIndexPath: indexPath) as! AddChoiceTableViewCell
      cell.delegate = self
      return cell
    }
    let cell = tableView.dequeueReusableCellWithIdentifier(AddQuestionsView.kReuseIdentifier, forIndexPath: indexPath)
    cell.textLabel?.text = choices?[indexPath.row]
    return cell
  }
  
  func configureView() {
    choices = [String]()
    tableView?.rowHeight = UITableViewAutomaticDimension
    tableView?.estimatedRowHeight = 140
    configureButtons()
    configureLabels()
  }
  func configureButtons() {
    addQuestionButton.setTitle(NSLocalizedString("AdminView.addQuestionButton.enabled.title", comment: ""), forState: .Normal)
    
  }
  func configureLabels() {
    self.title = NSLocalizedString("AddQuestionsView.titleLabel.text", comment: "")
    
  }
  func choiceDidAdded(choice: String?) {
    choices?.append(choice!)
    tableView.reloadData()
  }
  
  @IBAction func addQuestionAction(sender: AnyObject) {
    if !questionTextField.text!.isEmpty && choices?.count >= 2 {
      PKHUD.sharedHUD.contentView = PKHUDProgressView()
      PKHUD.sharedHUD.show()
      delegate?.sendNewChoice(questionTextField.text, choices: choices)
    } else {
      HUD.flash(.Error, delay: 1.0)
      // Completion Handler
      return
      
    }
  }
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    PKHUD.sharedHUD.hide()
  }
  
}

