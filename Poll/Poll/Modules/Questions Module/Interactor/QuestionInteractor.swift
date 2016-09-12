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
  
  init () {
    questionsAPIService = Service.sharedInstance
  }
  
  func loadQuestionsFromAPI() {
    questionsAPIService?.apiGETRequest({
      let jsonSting = "{\"result\":\($0 as! String)}"
      let questionItem = Mapper<QuestionsModel>().map(jsonSting)
      self.presenter?.updateQuestions(questionItem?.questions)
      
      }, failture: {
      self.presenter?.errorFromServer($0)
    })
  }
  func saveQuestionnaire(questions: [QuestionModel]?) {
    // var newQuestions
  }
  
}
