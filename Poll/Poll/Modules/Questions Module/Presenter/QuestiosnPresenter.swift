//
//  QuestionsPresenter.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class QuestionsPresenter: QuestionsPresenterProtocol, QuestionsDataManagerOutputProtocol, SelectionQuestionDelegate {
  var interactor: QuestionsDataManagerInputProtocol?
  var view: QuestionsViewProtocol?
  var wireframe: QuestionsWireframeProtocol?
  
  func loadQuestionView(question: QuestionModel?) {
    wireframe?.presentQuestionView(question)
  }
  func searchQuestions() {
    interactor?.loadQuestionsFromAPI()
  }
  func updateQuestions(questions: [QuestionModel]?) {
    view?.questions = questions
    view?.reloadViewQuestions()
  }
  func errorFromServer(error: NSError?) {
    view?.showErrorAlert(error)
  }
  func selectedIndex(index: Int?) {
    view?.selectedChoice(index)
  }
  func completedQuestionnaire(questions: [QuestionModel]?) {
    interactor?.saveQuestionnaire(questions)
  }
  
}
