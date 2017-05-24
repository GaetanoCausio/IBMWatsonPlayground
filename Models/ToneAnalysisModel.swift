//
//  ToneAnalyzerModel.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 22/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3
import RestKit

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

// MARK: - Watson Model Extensions

// Make the following objects JSONEncodable so we can get a Json string from it (for mockup)

extension ToneScore: JSONEncodable {
    
    /// Used to serialize this model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["tone_id"] = id
        json["tone_name"] = name
        json["score"] = score
        return json
    }
}

extension ToneCategory: JSONEncodable {
    
    /// Used to serialize this model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["category_name"] = name
        json["category_id"] = categoryID
        json["tones"] = tones.map { $0.toJSONObject() }
        return json
    }
}

extension SentenceAnalysis: JSONEncodable {
    
    /// Used to serialize this model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["sentence_id"] = sentenceID
        json["input_from"] = inputFrom
        json["input_to"] = inputTo
        json["text"] = text
        json["tone_categories"] = toneCategories.map { $0.toJSONObject() }
        return json
    }
}

extension ToneAnalysis: JSONEncodable {
    
    /// Used to serialize this model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["documentTone"] = documentTone.map { $0.toJSONObject() }
        if let sentencesTones=sentencesTones {
            json["sentencesTones"] = sentencesTones.map { $0.toJSONObject() }
        }
        return json
    }
}

