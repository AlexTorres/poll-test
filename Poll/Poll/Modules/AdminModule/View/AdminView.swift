//
//  AdminView.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import PKHUD

class AdminView: UIViewController, SetupViewProtocol, AdminViewProtocol {
  @IBOutlet weak var showResult: AnimationButton!
  @IBOutlet weak var addQuestionButton: AnimationButton!
  
  var presenter: protocol<AdminPresenterProtocol, AdminDataManagerOutputProtocol>?
  var questions: QuestionsModel?
  var wireframe: AdminWireframeProtocol?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureView()
    setUpView()
    
    // Do any additional setup after loading the view.
  }
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    refreshResults()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func setUpView() {
    wireframe = AdminWireframe(viewProtocol: self)
    refreshResults()
  }
  func refreshResults() {
    presenter?.getQuestions()
    
  }
  func refreshView() {
    
  }
  func configureView() {
    self.configureButtons()
    self.configureLabels()
  }
  func configureButtons() {
    showResult.setTitle(NSLocalizedString("AdminView.showResult.enabled.title", comment: ""), forState: .Normal)
    addQuestionButton.setTitle(NSLocalizedString("AdminView.addQuestionButton.enabled.title", comment: ""), forState: .Normal)
    
  }
  func configureLabels() {
    self.title = NSLocalizedString("AdminView.titleLabel.text", comment: "")
  }
  @IBAction func showResults(sender: AnyObject) {
    guard questions != nil else {
      HUD.flash(.Error, delay: 1.0)
      return
    }
    
    presenter?.presentResuls(questions)
  }
  
  @IBAction func addNewQuestionAction(sender: AnyObject) {
    presenter?.presentAddQuestion()
  }
  
}
