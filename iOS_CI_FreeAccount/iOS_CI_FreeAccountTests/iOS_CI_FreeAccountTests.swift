//
//  iOS_CI_FreeAccountTests.swift
//  iOS_CI_FreeAccountTests
//
//  Created by Bill Wu on 16/3/9.
//  Copyright © 2016年 Feng. All rights reserved.
//

import XCTest
@testable import iOS_CI_FreeAccount

class iOS_CI_FreeAccountTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample1() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample1() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testTrue() {
        XCTAssert(true, "Can not be zero");
    }
    
}
