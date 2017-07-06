//
//  ToneAnalysisService.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 06/07/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3


/** Facade service for all AI services performing Tone analisys
 
 all supported services must conform to protocol ToneAnalizable
 each service will return data in our required format: ToneAnalysisModel
 
 list of current supported services:
 - ToneAnalysisIBMService: Tone Analysis by IBM Watson service
 - ToneAnalysisOfflineService: Tone Analysis by a dummy Offline service
 
 */

protocol ToneAnalizable {
    
    init?() 
    
    func toneAnalisys(
        forText text:String,
        failure: ((Error) -> Void)? ,
        success: @escaping (ToneAnalysis) -> Void)
    
}

class ToneAnalysisService {
    
    private let service: ToneAnalizable?
    
    init?(service:ToneAnalizable?) {
        if let service = service {
            self.service = service
        } else {
            return nil // problems initializing the service
        }
    }

    func toneAnalisys(
        forText text:String,
        failure: ((Error) -> Void)? ,
        success: @escaping (ToneAnalysisModel) -> Void)
    {
        if let service = service {
            service.toneAnalisys(forText: text, failure: failure, success: { serviceModel in
                
                success(ToneAnalysisModel(serviceModel))
            })
        } else {
            failure?(ToneAnalysisError.serviceInitializationError(ServiceName: service.debugDescription))
        }
        
    }

}
