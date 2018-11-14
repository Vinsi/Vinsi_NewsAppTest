//
//  NewsAPITestCase.swift
//  NewsAppTests
//
//  Created by vinsi on 11/13/18.
//  Copyright © 2018 vinsi. All rights reserved.
//

import XCTest
@testable import NewsApp
class NewsAPITestCase: XCTestCase {
    let repo:IRepository = Repository()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAPIEverything() {
        
        let expectation = XCTestExpectation(description: "testAPIEverything")
        
        
        
     
        
       
        var request = EveryThingRequestModel()
        request.q = "bitcoin"
        self.repo.getEveryThing(requestObject: request) { (status, response) in
            
            if status.isSuccess()
            {
                
                expectation.fulfill()
                
            }
        }
         wait(for: [expectation], timeout: 20.0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testAPIHeadLines() {
        
        let expectation = XCTestExpectation(description: "testAPIHeadLines")
        
        
        
        
        
        
        var request = TopHeadlinesRequestModel()
        request.country = Countries.us
        self.repo.getTopHeadlines(requestObject: request) { (status, response) in
            
            if status.isSuccess()
            {
              
                expectation.fulfill()
                
            }
        }
        wait(for: [expectation], timeout: 20.0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testAPISources() {
        
        let expectation = XCTestExpectation(description: "testAPISources")
        
        
        
        
        
        
        var request = SourcesRequestModel()
        request.country = Countries.us
        
        self.repo.getSources(requestObject: request) { (status, response) in
            
            if status.isSuccess()
            {
                
                expectation.fulfill()
                
            }
        }
        wait(for: [expectation], timeout: 20.0)
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
