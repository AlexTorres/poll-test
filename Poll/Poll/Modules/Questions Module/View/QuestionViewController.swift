//
//  QuestionViewController.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/11/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, SetupViewProtocol {
  static let kStoryboradName = "QuestionViewController"
  var questionItem: QuestionModel?
  var delegate: SelectionQuestionDelegate?
  var selectedIndex: Int?
  
  @IBOutlet weak var sendButton: AnimationButton!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func configureView() {
    view.backgroundColor = UIColor.questionBlackColor(0.4)
    view.opaque = false
    configureButtons()
    
  }
  func configureLabels() {
    
  }
  func configureButtons() {
    sendButton.enabled = false
    sendButton.setTitle(NSLocalizedString("QuestionView.sendButton.enabled.title", comment: ""), forState: .Normal)
    sendButton.setTitle(NSLocalizedString("QuestionView.sendButton.disabled.title", comment: ""), forState: .Disabled)
    
  }
  
  @IBAction func closeAction(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
  }
  
  @IBAction func sendChoice(sender: AnyObject) {
    delegate?.selectedIndex(selectedIndex)
    self.dismissViewControllerAnimated(true, completion: nil)
  }
}
