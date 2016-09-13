//
//  AdminWireframe.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class AdminWireframe: AdminWireframeProtocol {
  var resultView: ResultsView?
  var presentedView: AdminView?
  var addQuestionView: AddQuestionsView?
  required init(viewProtocol view: AdminViewProtocol?) {
    
    let presenter: protocol<AdminPresenterProtocol, AdminDataManagerOutputProtocol> = AdminPresenter()
    let interactor: AdminDataManagerInputProtocol = AdminInteractor()
    view?.presenter = presenter
    presenter.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    presenter.wireframe = self
    presentedView = view as? AdminView
    
  }
  func presentResultView(questions: QuestionsModel?) {
    resultView = loadResultView()
    resultView?.questions = questions
    resultView?.hidesBottomBarWhenPushed = true
    presentedView?.navigationController?.pushViewController(resultView!, animated: true)
  }
  
  func presentAddQuestion() {
    addQuestionView = loadAddQuestionsView()
    addQuestionView?.delegate = presentedView?.presenter as? AddQuestionProtocol
    addQuestionView?.hidesBottomBarWhenPushed = true
    presentedView?.navigationController?.pushViewController(addQuestionView!, animated: true)
    
  }
  
  func loadAddQuestionsView() -> AddQuestionsView? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier(AddQuestionsView.kStoryboradName) as? AddQuestionsView
    
  }
  
  func loadResultView() -> ResultsView? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier(ResultsView.kStoryboradName) as? ResultsView
    
  }
  func popAddQuestionView() {
    addQuestionView?.navigationController?.popViewControllerAnimated(true)
  }
  
}
