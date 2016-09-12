//
//  QuestionaryView.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import PKHUD
class QuestionnaireView: UIViewController, QuestionsViewProtocol, SetupViewProtocol {
  var presenter: protocol<QuestionsPresenterProtocol, QuestionsDataManagerOutputProtocol>?
  var questions: [QuestionModel]?
  var wireframe: QuestionsWireframeProtocol?
  var selectedQuestion: Int?
  @IBOutlet weak var tableView: UITableView?
  
  @IBOutlet weak var sendQuestionnaireButton: AnimationButton!
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    configureView()
    
    // Do any additional setup after loading the view.
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func setupView() {
    wireframe = QuestionsWireframe(viewProtocol: self)
    presenter?.searchQuestions()
    PKHUD.sharedHUD.contentView = PKHUDProgressView()
    PKHUD.sharedHUD.show()
    
  }
  
  func reloadViewQuestions() {
    HUD.flash(.Success, delay: 1.0)
    
    tableView?.reloadData()
    tableView?.tableFooterView = UIView()
  }
  
  func showErrorAlert(error: NSError?) {
    HUD.flash(.Error, delay: 1.0)
    
  }
  func configureView() {
    tableView?.rowHeight = UITableViewAutomaticDimension
    tableView?.estimatedRowHeight = 140
    configureLabels()
    configureButtons()
  }
  func configureLabels() {
    
    self.title = NSLocalizedString("QuestionnaireView.titleLabel.text", comment: "")
  }
  func configureButtons() {
    sendQuestionnaireButton.enabled = false
    sendQuestionnaireButton.setTitle(NSLocalizedString("QuestionnaireView.sendQuestionaryButton.enabled.title", comment: ""), forState: .Normal)
    sendQuestionnaireButton.setTitle(NSLocalizedString("QuestionnaireView.sendQuestionaryButton.disabled.title", comment: ""), forState: .Disabled)
  }
  
  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
  }
  func selectedChoice(index: Int?) {
    updateQuestionnaire(index)
    let indexPath = NSIndexPath(forRow: selectedQuestion!, inSection: 0)
    let cell = tableView?.cellForRowAtIndexPath(indexPath) as? QuestionTableViewCell
    cell?.showCheck()
    checkStatusButton()
  }
  func updateQuestionnaire(index: Int?) {
    questions![selectedQuestion!].isAnswered = true
    questions![selectedQuestion!].selectedChoice = UInt(index!)
    questions![selectedQuestion!].choices![index!].votes  =  questions![selectedQuestion!].choices![index!].votes! + 1
  }
  func checkStatusButton() {
    sendQuestionnaireButton.enabled = questions!.reduce(true, combine: { $0 && $1.isAnswered })
  }
  
  @IBAction func sendAction(sender: AnyObject) {
    presenter?.completedQuestionnaire(questions)
  }
  
}
