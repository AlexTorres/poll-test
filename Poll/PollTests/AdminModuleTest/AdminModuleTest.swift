//
//  AdminModuleTest.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import XCTest
import ObjectMapper
import SwiftCharts
@testable import Poll

class AdminModuleTest: XCTestCase {
  
  let view = AdminView()
  var questionItem: QuestionsModel?
  var questionItemZeroVotes: QuestionsModel?
  var presenter: protocol<AdminPresenterProtocol, AdminDataManagerOutputProtocol>?
  var wireframe: AdminWireframeProtocol?
  var interactor: AdminDataManagerInputProtocol?
  
  override func setUp() {
    super.setUp()
    view.setUpView()
    presenter = view.presenter
    wireframe = view.wireframe
    interactor = presenter?.interactor
    questionItem = questionItemWithMock("mock")
    questionItemZeroVotes = questionItemWithMock("mockZero")
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  func questionItemWithMock(jsonName: String?) -> QuestionsModel? {
    interactor = presenter?.interactor
    let bundle = NSBundle(forClass: self.dynamicType)
    let path = bundle.pathForResource(jsonName, ofType: "json")
    let jsonData = NSData(contentsOfFile: path!)
    let dataString = String(data: jsonData!, encoding: NSUTF8StringEncoding)
    let jsonSting = "{\"result\":\(dataString!)}"
    return Mapper<QuestionsModel>().map(jsonSting)
  }
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  func testOutputWithData() {
    presenter?.getQuestions()
    let localManager = LocalManager()
    if localManager.questions != nil {
      XCTAssertNotNil(view.questions)
    } else {
      XCTAssertNil(view.questions, "no hay objetos para El administador")
      
    }
    
  }
  
  func testShowOtherViews() {
    let selectedQuestion = questionItem?.questions![0]
    XCTAssertNotNil(selectedQuestion)
    
    let adminWireframe = wireframe as? AdminWireframe
    presenter?.presentResults(questionItem)
    XCTAssertNotNil(adminWireframe?.presentedView)
    XCTAssertNotNil(adminWireframe?.resultView)
    presenter?.presentAddQuestion()
    XCTAssertNotNil(adminWireframe?.addQuestionView)
    
  }
  func testDataForShow() {
    let adminWireframe = wireframe as? AdminWireframe
    view.questions = questionItem
    view.showResults(self)
    let resultView = adminWireframe?.resultView
    
    XCTAssertNotNil(resultView?.questions)
  }
  
  func testDataZeroForShow() {
    let viewZero = AdminView()
    viewZero.setUpView()
    let adminWireframe = viewZero.presenter?.wireframe as? AdminWireframe
    viewZero.questions = questionItemZeroVotes
    viewZero.showResults(self)
    let resultView = adminWireframe?.resultView
    
    XCTAssertNil(resultView)
  }
  
  func testProtocolsConnections() {
    let adminWireframe = wireframe as? AdminWireframe
    XCTAssertTrue(view === adminWireframe?.presentedView)
    XCTAssertTrue(presenter?.wireframe === view.wireframe)
    XCTAssertTrue(presenter === interactor?.presenter)
  }
  
  func testModuleClasses() {
    XCTAssertNotNil(presenter)
    XCTAssertNotNil(wireframe)
    XCTAssertNotNil(interactor)
  }
}
