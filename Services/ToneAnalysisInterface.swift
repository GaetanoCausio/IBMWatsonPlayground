//
//  ToneAnalysisInterface.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 23/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3

/// Interface layer handling all communications with the Watson API service ToneAnalyzerV3

public class ToneAnalysisInterface: NSObject {

    // MARK: - Public Interface
    
    // initialize the interface by connectin with the API service
    init(username:String, password:String, version:String) {
        
        toneAnalyzer = ToneAnalyzer(username: username,
                                    password: password,
                                     version: version)
    }
    
    public func getTone(ofText text: String, failure: ((Error) -> Void)? = nil) {

        toneAnalyzer.getTone(ofText: text, failure: failure) { resultTones in
            
            // set model from result of service
            self.toneAnalysisModel = ToneAnalysisModel(with: resultTones)
        }

    }

    // MARK: - Private implementation
    
    // holds reference to the service
    private let toneAnalyzer:ToneAnalyzer
    
    // holds the results of the service (if any)
    private var toneAnalysisModel:ToneAnalysisModel?
    

}
