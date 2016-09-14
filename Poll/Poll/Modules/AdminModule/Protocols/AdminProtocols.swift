//
//  AdminProtocols.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation

protocol AdminViewProtocol: class {
  var presenter: protocol<AdminPresenterProtocol, AdminDataManagerOutputProtocol>? { get set }
  var questions: QuestionsModel? { get set }
  var wireframe: AdminWireframeProtocol? { get set }
  
  func setUpView()
  func refreshView()
  
}
protocol AdminPresenterProtocol: class {
  var view: AdminViewProtocol? { get set }
  var interactor: AdminDataManagerInputProtocol? { get set }
  var wireframe: AdminWireframeProtocol? { get set }
  
  func getQuestions()
  func presentResults(questions: QuestionsModel?)
  func presentAddQuestion()
  func closeAddQuestionView()
  
}
protocol AdminDataManagerInputProtocol: class {
  var presenter: protocol<AdminPresenterProtocol, AdminDataManagerOutputProtocol>? { get set }
  var adminAPIService: Service? { get set }
  var localManager: LocalManager? { get set }
  
  func loadQuestionsFromLocal ()
  func createQuestion(questions: QuestionModel?)
  func createNewQuestion(question: String?, choices: [String]?)
  
}

protocol AdminDataManagerOutputProtocol: class {
  func errorFromServer(error: NSError?)
  func loadedQuestions(questions: QuestionsModel?)
}

protocol AdminWireframeProtocol: class {
  init (viewProtocol view: AdminViewProtocol?)
  func presentResultView(questions: QuestionsModel?)
  func presentAddQuestion()
  func popAddQuestionView()
  
}
protocol AddQuestionProtocol: class {
  func sendNewChoice(question: String?, choices: [String]?)
}
protocol AddChoiceProtocol: class {
  func choiceDidAdded(choice: String?)
}

