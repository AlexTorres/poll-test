//
//  AdminInteractor.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import Foundation

class AdminInteractor: AdminDataManagerInputProtocol {
  var adminAPIService: Service?
  var localManager: LocalManager?
  var presenter: protocol<AdminDataManagerOutputProtocol, AdminPresenterProtocol>?
  init() {
    adminAPIService = Service.sharedInstance
    localManager = LocalManager.sharedInstance
  }
  func createQuestion(questions: QuestionModel?) {
    
  }
  func loadQuestionsFromLocal() {
    presenter?.loadedQuestions(LocalManager.sharedInstance.questions)
    
  }
  func createNewQuestion(question: String?, choices: [String]?) {
    let paramethers: [String: AnyObject] = [
      "question": question!,
      "choices": choices!]
    adminAPIService?.apiPOSTRequest(paramethers, completion: {
      print($0)
      self.presenter?.closeAddQuestionView()
      }, failture: {
      self.presenter?.closeAddQuestionView()
      print($0)
    })
    
  }
  
}
