//
//  ViewController.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 14/05/2017.
//  Copyright © 2017 Garinuetano Causio. All rights reserved.
//

import UIKit
import ToneAnalyzerV3

class ViewController: UIViewController {
    
    func failure(error: Error) {
        print("ERROR: \(error)")
    }

    var test: ToneAnalysis?
    
    override func viewDidLoad() {
    
        // just a quick test to check everything locally and from github is correctly working
        // before I actually starting working on this this project
        
        let text = "I know the times are difficult! Our sales have been disappointing for " +
            "the past three quarters for our data analytics product suite. We have a " +
            "competitive data analytics product suite in the industry. But we need " +
        "to do our job selling it! "
        
        
        let toneAnalyzer = ToneAnalyzer(username: Credentials.toneAnalyzer.username!,
                                    password: Credentials.toneAnalyzer.password!,
                                    version: Credentials.toneAnalyzer.version!)
        
        toneAnalyzer.getTone(ofText: text, failure: failure) { tones in
            
            // find the most top tone scores per category
            for value in tones.documentTone {
                var winnerScore = 0.0
                var winnerName = ""
                for tone in value.tones {
                    if tone.score > winnerScore {
                        winnerScore = tone.score
                        winnerName = tone.name
                    }
                }
                if let firstWord = value.name.components(separatedBy: " ").first {
                    print("\(firstWord): \(winnerName) (\(Int(winnerScore*100))%)")
                }
            }
            

        }
        
    }

}

