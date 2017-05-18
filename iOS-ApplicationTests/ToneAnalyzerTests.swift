//
//  iOS_ApplicationTests.swift
//  iOS-ApplicationTests
//
//  Created by Gaetano Causio on 17/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import XCTest
import ToneAnalyzerV3

class ToneAnalyzerTests: XCTestCase {

    private let timeout: TimeInterval = 5.0
    
    private let text = "I know the times are difficult! Our sales have been disappointing for " +
               "the past three quarters for our data analytics product suite. We have a " +
               "competitive data analytics product suite in the industry. But we need " +
               "to do our job selling it! "

    var toneAnalyzer: ToneAnalyzer!
        
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    /** Fail false negatives. */
    func failWithError(error: Error) {
        XCTFail("Service failed with error: \(error)")
    }

    /** Wait for expectations. */
    func waitForExpectations() {
        waitForExpectations(timeout: timeout) { error in
            XCTAssertNil(error, "Timeout")
        }
    }
    
    /** Test the service itself */
    func testToneAnalyzerV3API() {

        toneAnalyzer = ToneAnalyzer(username: Credentials.toneAnalyzer.username!,
                                        password: Credentials.toneAnalyzer.password!,
                                         version: Credentials.toneAnalyzer.version!)

        let description = "Analyze the tone of the given text using the default parameters."
        let expectation = self.expectation(description: description)
        
        toneAnalyzer.getTone(ofText: text, failure: failWithError) { tones in
            
            XCTAssert(tones.documentTone.count>2)
            
            // find the most top tone scores per category
            var winnerNames = [String]()
            for value in tones.documentTone {
                var winnerScore = 0.0
                var winnerName = ""
                for tone in value.tones {
                    if tone.score > winnerScore {
                        winnerScore = tone.score
                        winnerName = tone.name
                    }
                }
                winnerNames.append(winnerName)
            }
            
            // check the top 3, these should remain the same regardless of exact score which may vary
            winnerNames.sort()
            XCTAssert(winnerNames[2] == "Sadness")
            XCTAssert(winnerNames[0] == "Analytical")
            XCTAssert(winnerNames[1] == "Emotional Range")
            
            expectation.fulfill()
        }
        
        waitForExpectations()
        
    }
    
}
