//
//  QuestionsWireframe.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class QuestionsWireframe: NSObject, QuestionsWireframeProtocol, UIViewControllerTransitioningDelegate {
  var presentedView: QuestionnaireView?
  var modalView: QuestionViewController?
  required init (viewProtocol view: QuestionsViewProtocol?) {
    super.init()
    let presenter: protocol<QuestionsPresenterProtocol, QuestionsDataManagerOutputProtocol> = QuestionsPresenter()
    let interactor: QuestionsDataManagerInputProtocol = QuestionsInteractor()
    view?.presenter = presenter
    presenter.interactor = interactor
    interactor.presenter = presenter
    presenter.view = view
    presenter.wireframe = self
    presentedView = view as? QuestionnaireView
  }
  
  func presentQuestionView(question: QuestionModel?) {
    modalView = loadModalQuestion()
    modalView?.transitioningDelegate = self
    modalView?.modalPresentationStyle = .OverCurrentContext
    modalView?.modalPresentationCapturesStatusBarAppearance = true
    presentedView?.tabBarController?.presentViewController(modalView!, animated: true, completion: nil)
    modalView?.questionItem = question
    modalView?.delegate = presentedView?.presenter as? SelectionQuestionDelegate
    
  }
  
  func loadModalQuestion() -> QuestionViewController? {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    return storyboard.instantiateViewControllerWithIdentifier(QuestionViewController.kStoryboradName) as? QuestionViewController
    
  }
  
  func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    return DismissingAnimator() as UIViewControllerAnimatedTransitioning
  }
  func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    
    return PresentingAnimator() as UIViewControllerAnimatedTransitioning
  }
  
}
