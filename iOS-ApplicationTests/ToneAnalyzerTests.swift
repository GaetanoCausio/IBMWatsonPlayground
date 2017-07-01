//
//  iOS_ApplicationTests.swift
//  iOS-ApplicationTests
//
//  Created by Gaetano Causio on 17/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import XCTest
import ToneAnalyzerV3
import RestKit

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

    //** Test all helpers and generics functions of ToneAnalyzerModel */
    func testToneAnalyzerModelFunctions() {
        
        // test ToneScore offline data
        if let json = try? JSON(string: jsonStringToneScore) {
            if let toneScore = try? ToneScore(json: json) {
                XCTAssert(toneScore.id == "anger")
                XCTAssert(toneScore.name == "Anger")
                XCTAssert(toneScore.score == 0.069519)
                let jsonString = try? toneScore.toJSON().serializeString()
                XCTAssert(jsonString == jsonStringToneScore)
            } else {
                XCTFail("Unable to cast JSON to ToneScore")
            }
        } else {
            XCTFail("Unable to cast JSON to ToneScore")
        }

        // test ToneCategory offline data
        if let json = try? JSON(string: jsonStringToneCategory) {
            if let toneCategory = try? ToneCategory(json: json) {
                XCTAssert(toneCategory.categoryID == "emotion_tone")
                XCTAssert(toneCategory.name == "Emotion Tone")
                XCTAssert(toneCategory.tones.count == 5)
                XCTAssert(toneCategory.tones[3].id == "joy")
                XCTAssert(toneCategory.tones[1].name == "Disgust")
                let jsonString = try? toneCategory.toJSON().serializeString()
                XCTAssert(jsonString == jsonStringToneCategory)
            } else {
                XCTFail("Unable to cast JSON to ToneCategory")
            }
        } else {
            XCTFail("Unable to cast JSON to ToneCategory")
        }

        // test SentenceAnalysis offline data
        if let json = try? JSON(string: jsonStringSentenceAnalysis) {
            if let sentenceAnalysis = try? SentenceAnalysis(json: json) {
                XCTAssert(sentenceAnalysis.toneCategories.count == 3)
                XCTAssert(sentenceAnalysis.inputTo == 31)
                XCTAssert(sentenceAnalysis.sentenceID == 3)
                XCTAssert(sentenceAnalysis.text == "I know the times are difficult!")
                XCTAssert(sentenceAnalysis.toneCategories[2].categoryID == "social_tone")
                XCTAssert(sentenceAnalysis.toneCategories[1].name == "Language Tone")
                XCTAssert(sentenceAnalysis.toneCategories[0].tones.count == 5)
                XCTAssert(sentenceAnalysis.toneCategories[0].tones[4].name == "Sadness")
                XCTAssert(sentenceAnalysis.toneCategories[0].tones[2].score == 0.25423)
                let jsonString = try? sentenceAnalysis.toJSON().serializeString()
                XCTAssert(jsonString != nil)
            } else {
                XCTFail("Unable to cast JSON to SentenceAnalysis")
            }
        } else {
            XCTFail("Unable to cast JSON to SentenceAnalysis")
        }

        // test ToneAnalysis offline data
        if let json = try? JSON(string: jsonStringToneAnalysis) {
            if let toneAnalysis = try? ToneAnalysis(json: json) {
                XCTAssert(toneAnalysis.documentTone.count == 3)
                XCTAssert(toneAnalysis.documentTone[1].name == "Language Tone")
                XCTAssert(toneAnalysis.documentTone[0].tones.count == 5)
                XCTAssert(toneAnalysis.documentTone[0].tones[4].id == "sadness")
                if let sentencesTones = toneAnalysis.sentencesTones {
                    XCTAssert(sentencesTones.count == 4)
                    XCTAssert(sentencesTones[2].text == "We have a competitive data analytics product suite in the industry.")
                    XCTAssert(sentencesTones[1].toneCategories.count == 3)
                    XCTAssert(sentencesTones[1].toneCategories[0].categoryID == "emotion_tone")
                }
                let jsonString = try? toneAnalysis.toJSON().serializeString()
                XCTAssert(jsonString != nil)
            } else {
                XCTFail("Unable to cast JSON to ToneAnalysis")
            }
        } else {
            XCTFail("Unable to cast JSON to ToneAnalysis")
        }
        
    }
    
    
}
