//
//  AdminPresenter.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit

class AdminPresenter: AdminPresenterProtocol, AdminDataManagerOutputProtocol, AddQuestionProtocol {
  var interactor: AdminDataManagerInputProtocol?
  var view: AdminViewProtocol?
  var wireframe: AdminWireframeProtocol?
  func errorFromServer(error: NSError?) {
    
  }
  func getQuestions() {
    interactor?.loadQuestionsFromLocal()
  }
  func loadedQuestions(questions: QuestionsModel?) {
    view?.questions = questions
  }
  func presentResults(questions: QuestionsModel?) {
    wireframe?.presentResultView(questions)
  }
  func presentAddQuestion() {
    wireframe?.presentAddQuestion()
    
  }
  func sendNewChoice(question: String?, choices: [String]?) {
    interactor?.createNewQuestion(question, choices: choices)
  }
  func closeAddQuestionView() {
    wireframe?.popAddQuestionView()
  }
}
