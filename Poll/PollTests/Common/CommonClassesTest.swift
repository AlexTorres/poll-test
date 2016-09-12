//
//  CommonClassesTest.swift
//  Poll
//
//  Created by John Alexandert Torres on 9/9/16.
//  Copyright © 2016 webcat. All rights reserved.
//

import XCTest
import OHHTTPStubs
@testable import Poll
class CommonClassesTest: XCTestCase {
  override func setUp() {
    super.setUp()
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testConfigurationCase() {
    let testConfiguration = Configuration()
    
    XCTAssertNotNil(testConfiguration.configuration)
    XCTAssertNotNil(testConfiguration.path)
    XCTAssertNotNil(testConfiguration.apiEndPoint)
    
  }
  
  func testAPIServices () {
    let expectation = self.expectationWithDescription("High Expectations")
    let service = Service()
    service.apiGETRequest({
      XCTAssertNotNil($0)
      expectation.fulfill()
    }) {
      XCTAssertNotNil($0)
      expectation.fulfill()
    }
    waitForExpectationsWithTimeout(60) { print($0.debugDescription) }
  }
}
