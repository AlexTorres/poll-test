//
//  QuestionInteractor.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/10/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import UIKit
import ObjectMapper

class QuestionsInteractor: QuestionsDataManagerInputProtocol {
  var presenter: protocol<QuestionsDataManagerOutputProtocol, QuestionsPresenterProtocol>?
  var questionsAPIService: Service?
  var localManager: LocalManager?
  
  init () {
    questionsAPIService = Service.sharedInstance
    localManager = LocalManager.sharedInstance
  }
  
  func loadQuestionsFromAPI() {
  
    questionsAPIService?.apiGETRequest({
      let jsonSting = "{\"result\":\($0 as! String)}"
      let questionItem = Mapper<QuestionsModel>().map(jsonSting)
      self.localManager?.questions = questionItem
      self.presenter?.updateQuestions(questionItem)
      
      }, failture: {
      self.presenter?.errorFromServer($0)
    })
  }
  func saveQuestionnaire(questions: QuestionsModel?) {
    // var newQuestions
    
    for (_, var value) in questions!.questions!.enumerate() {
      value.isAnswered = false
    }
    localManager?.questions = questions
    
    self.presenter?.updateQuestions(localManager?.questions)
  }
  
}
