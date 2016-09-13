//
//  AdminModuleTest.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/12/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import XCTest
import ObjectMapper
@testable import Poll

class AdminModuleTest: XCTestCase {
  
  let view = AdminView()
  var questionItem: QuestionsModel?
  var presenter: protocol<AdminPresenterProtocol, AdminDataManagerOutputProtocol>?
  var wireframe: AdminWireframeProtocol?
  var interactor: AdminDataManagerInputProtocol?
  
  override func setUp() {
    super.setUp()
    view.setUpView()
    presenter = view.presenter
    wireframe = view.wireframe
    interactor = presenter?.interactor
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
    
    let questionsWireframe = wireframe as? AdminWireframe
    presenter?.presentResuls(questionItem)
    XCTAssertNotNil(questionsWireframe?.presentedView)
    XCTAssertNotNil(questionsWireframe?.resultView)
    presenter?.presentAddQuestion()
    XCTAssertNotNil(questionsWireframe?.addQuestionView)
    
  }
  
  func testProtocolsConnections() {
    let questionsWireframe = wireframe as? AdminWireframe
    XCTAssertTrue(view === questionsWireframe?.presentedView)
    XCTAssertTrue(presenter?.wireframe === view.wireframe)
    XCTAssertTrue(presenter === interactor?.presenter)
  }
  
  func testModuleClasses() {
    XCTAssertNotNil(presenter)
    XCTAssertNotNil(wireframe)
    XCTAssertNotNil(interactor)
  }
}
