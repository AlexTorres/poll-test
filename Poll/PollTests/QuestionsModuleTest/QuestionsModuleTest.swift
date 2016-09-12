//
//  QuestionsModuleTest.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import Poll

class QuestionsModuleTest: XCTestCase {
  
  let view = QuestionnaireView()
  var questionItem: QuestionsModel?
  var presenter: protocol<QuestionsPresenterProtocol, QuestionsDataManagerOutputProtocol>?
  var wireframe: QuestionsWireframeProtocol?
  var interactor: QuestionsDataManagerInputProtocol?
  
  // var interctorMock:QuestionsDataManagerInputProtocol
  override func setUp() {
    super.setUp()
    view.setupView()
    presenter = view.presenter
    wireframe = view.wireframe
    loadMock()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  func loadMock() {
    interactor = presenter?.interactor
    let bundle = NSBundle(forClass: self.dynamicType)
    let path = bundle.pathForResource("mock", ofType: "json")
    let jsonData = NSData(contentsOfFile: path!)
    let dataString = String(data: jsonData!, encoding: NSUTF8StringEncoding)
    let jsonSting = "{\"result\":\(dataString!)}"
    questionItem = Mapper<QuestionsModel>().map(jsonSting)
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testModuleClasses() {
    XCTAssertNotNil(presenter)
    XCTAssertNotNil(wireframe)
    XCTAssertNotNil(interactor)
  }
  
  func testOutputWithData() {
    
    presenter?.updateQuestions(questionItem?.questions)
    XCTAssertNotNil(view.questions)
    XCTAssertTrue(view.questions?.count > 0)
  }
  
  func testShowQuestion() {
    let selectedQuestion = questionItem?.questions![0]
    XCTAssertNotNil(selectedQuestion)
    presenter?.loadQuestionView(selectedQuestion)
    let questionsWireframe = wireframe as? QuestionsWireframe
    XCTAssertNotNil(questionsWireframe?.presentedView)
    XCTAssertTrue(questionsWireframe?.modalView?.delegate === presenter)
    
  }
  
  func testOutPutWithZeroData() {
    let bundle = NSBundle(forClass: self.dynamicType)
    let path = bundle.pathForResource("mockZero", ofType: "json")
    let jsonData = NSData(contentsOfFile: path!)
    let dataString = String(data: jsonData!, encoding: NSUTF8StringEncoding)
    let jsonSting = "{\"result\":\(dataString!)}"
    let questionZeroItem = Mapper<QuestionsModel>().map(jsonSting)
    presenter?.updateQuestions(questionZeroItem?.questions)
    XCTAssertNotNil(view.questions)
    XCTAssertTrue(view.questions?.count == 0)
  }
  
  func testProtocolsConnections() {
    let questionsWireframe = wireframe as? QuestionsWireframe
    XCTAssertTrue(view === questionsWireframe?.presentedView)
    XCTAssertTrue(presenter?.wireframe === view.wireframe)
    XCTAssertTrue(presenter === interactor?.presenter)
  }
}
