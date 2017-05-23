//
//  ToneAnalyzerModel.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 22/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3

// MARK: - Public Interface

public typealias DocumentTone = [String: [NameScore]]

/** A model that holds the results of performing tone analysis on a document. */
public struct ToneAnalysisModel {
    
    // Tone analysis results of the entire document's text.
    fileprivate let analysis: DocumentTone
    
    public init(with toneAnalysis: ToneAnalysis) {
        analysis = ToneAnalysisModelHelper.decode(using: toneAnalysis)
    }

}

// MARK: - Private implementation

fileprivate struct ToneAnalysisModelHelper {
    
     fileprivate static func decode(using toneAnalysis: ToneAnalysis) -> DocumentTone {
        
        //TODO: here we need to decode ToneAnalysis into a DocumentTone
        let documentTone = DocumentTone()
        
        return documentTone
    }

    
}
