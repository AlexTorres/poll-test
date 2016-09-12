//
//  QuestiosnProtocols.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation
import ObjectMapper

protocol QuestionsViewProtocol: class {
  var presenter: protocol<QuestionsPresenterProtocol, QuestionsDataManagerOutputProtocol>? { get set }
  var questions: [QuestionModel]? { get set }
  var wireframe: QuestionsWireframeProtocol? { get set }
  
  func setupView()
  func reloadViewQuestions()
  func showErrorAlert(error: NSError?)
  func selectedChoice(index: Int?)
  
}
protocol QuestionsPresenterProtocol: class {
  var view: QuestionsViewProtocol? { get set }
  var interactor: QuestionsDataManagerInputProtocol? { get set }
  var wireframe: QuestionsWireframeProtocol? { get set }
  
  func searchQuestions()
  func loadQuestionView(question: QuestionModel?)
  func completedQuestionnaire(questions: [QuestionModel]?)
}
protocol QuestionsDataManagerInputProtocol: class {
  var presenter: protocol<QuestionsPresenterProtocol, QuestionsDataManagerOutputProtocol>? { get set }
  var questionsAPIService: Service? { get set }
  
  func loadQuestionsFromAPI ()
  func saveQuestionnaire(questions: [QuestionModel]?)
  
}

protocol QuestionsDataManagerOutputProtocol: class {
  func updateQuestions(questions: [QuestionModel]?)
  func errorFromServer(error: NSError?)
}

protocol QuestionsWireframeProtocol: class {
  init (viewProtocol view: QuestionsViewProtocol?)
  func presentQuestionView(question: QuestionModel?)
}
protocol SelectionQuestionDelegate: class {
  func selectedIndex(index: Int?)
  
}
