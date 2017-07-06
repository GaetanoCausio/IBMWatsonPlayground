//
//  ToneAnalysisModel.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 22/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3
import RestKit

public typealias DocumentTone = [String: [ItemScore]]


/** A model that holds the results of performing tone analysis on a document. */
public struct ToneAnalysisModel {

    private let analisysResults: DocumentTone

    init(_ toneAnalysis:ToneAnalysis) {
        
        // TODO: mapping to DocumentTone
        analisysResults = DocumentTone()
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

extension ToneAnalysis: JSONEncodable {
    
    /// Used to serialize this model to JSON.
    public func toJSONObject() -> Any {
        var json = [String: Any]()
        json["document_tone"] = documentTone.map { $0.toJSONObject() }
        if let sentencesTones=sentencesTones {
            json["sentences_tone"] = sentencesTones.map { $0.toJSONObject() }
        }
        return json
    }

    // Fix an issue with the IBM SDK initializer that prevents from casting the JSON object
    // ORIGINAL: documentTone = try json.decodedArray(at: "document_tone", "tone_categories", type: ToneCategory.self)
    // MODIFIED: documentTone = try json.decodedArray(at: "document_tone", type: ToneCategory.self)
    public init(json: JSON) throws {
        documentTone = try json.decodedArray(at: "document_tone", type: ToneCategory.self)
        sentencesTones = try? json.decodedArray(at: "sentences_tone", type: SentenceAnalysis.self)
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

