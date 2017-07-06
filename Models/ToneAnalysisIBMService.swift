//
//  ToneAnalysisIBMService.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 05/07/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3
import RestKit

class ToneAnalysisIBMService: ToneAnalizable {
    
    private var toneAnalyzer: ToneAnalyzer!
    
    /**
     Initialization of the service buy connecting to IBM Watson with the proper credentials.
     */
    required init?() {
        toneAnalyzer = ToneAnalyzer(username: "abc",
                                    password: Credentials.toneAnalyzer.password!,
                                    version: Credentials.toneAnalyzer.version!)
        // Apparently the service is always correctly initialized, even with wrong credentials
        // So we get an error only when performing credentials
    }
    
    /**
     Perform asyncronous tone analisys of the given text by calling the specific IBM Watson service.
     
     - parameter text:    the text to be analized
     - parameter failure: a function executed if the call fails
     - parameter success: a function executed with results of Tone Analisys
     */
    func toneAnalisys(
        forText text:String,
        failure: ((Error) -> Void)? = nil,
        success: @escaping (ToneAnalysis) -> Void)
    {
        toneAnalyzer.getTone(ofText: text, failure: failure) { tones in
            
        }
        
    }


}
