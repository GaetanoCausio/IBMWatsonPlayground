//
//  ToneAnalysisOfflineService.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 29/06/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation
import ToneAnalyzerV3
import RestKit

/// holds all offline data that can be used to test the app

class ToneAnalysisOfflineService: ToneAnalizable {
    
    required init?() { /* offline service init never fails */ }
    
    /**
     Perform a dummy tone analisys by using offline data.
     No matter what the input text would be the results would always be the same.
     
     - parameter text:    dummy, not used
     - parameter failure: dummy, not used
     - parameter success: a function executed with results of Tone Analisys
     */
    func toneAnalisys(
        forText text:String,
        failure: ((Error) -> Void)? = nil,
        success: @escaping (ToneAnalysis) -> Void)
    {
        
        // check whether to return a positive or negative response
        let jsonString:String
        if text == "invalidresponse" {
            jsonString = ToneAnalysisOfflineService.jsonStringInvalid
        } else {
            jsonString = ToneAnalysisOfflineService.jsonStringToneAnalysis
        }
        
        // get ToneAnalysis offline data
        if let json = try? JSON(string: jsonString) {
            if let toneAnalysis = try? ToneAnalysis(json: json) {
                success(toneAnalysis)
                return
            }
        }
        
        failure?(ToneAnalysisError.unableToParseJSON)

    }

    // MARK: Offline JSON Data
    
    static let jsonStringInvalid = "{\"This json string cannot be parsed...\":0.069519}"
    
    static let jsonStringToneScore = "{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.069519}"
    
    static let jsonStringToneCategory = "{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.069519},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.018293},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.294711},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.016231},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.558511}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"}"
    
    static let jsonStringSentenceAnalysis = "{\"tone_categories\":[{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.09483},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.089878},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.25423},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.08979},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.49462}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"},{\"tones\":[{\"tone_id\":\"analytical\",\"tone_name\":\"Analytical\",\"score\":0.842108},{\"tone_id\":\"confident\",\"tone_name\":\"Confident\",\"score\":0},{\"tone_id\":\"tentative\",\"tone_name\":\"Tentative\",\"score\":0}],\"category_id\":\"language_tone\",\"category_name\":\"Language Tone\"},{\"tones\":[{\"tone_id\":\"openness_big5\",\"tone_name\":\"Openness\",\"score\":0.20687},{\"tone_id\":\"conscientiousness_big5\",\"tone_name\":\"Conscientiousness\",\"score\":0.198762},{\"tone_id\":\"extraversion_big5\",\"tone_name\":\"Extraversion\",\"score\":0.09639},{\"tone_id\":\"agreeableness_big5\",\"tone_name\":\"Agreeableness\",\"score\":0.573345},{\"tone_id\":\"emotional_range_big5\",\"tone_name\":\"Emotional Range\",\"score\":0.06478}],\"category_id\":\"social_tone\",\"category_name\":\"Social Tone\"}],\"input_from\":0,\"sentence_id\":3,\"text\":\"I know the times are difficult!\",\"input_to\":31}"
    
    static let jsonStringToneAnalysis = "{\"document_tone\":[{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.069519},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.018293},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.294711},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.016231},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.558511}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"},{\"tones\":[{\"tone_id\":\"analytical\",\"tone_name\":\"Analytical\",\"score\":0.747663},{\"tone_id\":\"confident\",\"tone_name\":\"Confident\",\"score\":0},{\"tone_id\":\"tentative\",\"tone_name\":\"Tentative\",\"score\":0}],\"category_id\":\"language_tone\",\"category_name\":\"Language Tone\"},{\"tones\":[{\"tone_id\":\"openness_big5\",\"tone_name\":\"Openness\",\"score\":0.045407},{\"tone_id\":\"conscientiousness_big5\",\"tone_name\":\"Conscientiousness\",\"score\":0.415061},{\"tone_id\":\"extraversion_big5\",\"tone_name\":\"Extraversion\",\"score\":0.529313},{\"tone_id\":\"agreeableness_big5\",\"tone_name\":\"Agreeableness\",\"score\":0.067263},{\"tone_id\":\"emotional_range_big5\",\"tone_name\":\"Emotional Range\",\"score\":0.839494}],\"category_id\":\"social_tone\",\"category_name\":\"Social Tone\"}],\"sentences_tone\":[{\"tone_categories\":[{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.109982},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.052523},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.188796},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.050798},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.652685}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"},{\"tones\":[{\"tone_id\":\"analytical\",\"tone_name\":\"Analytical\",\"score\":0.842108},{\"tone_id\":\"confident\",\"tone_name\":\"Confident\",\"score\":0},{\"tone_id\":\"tentative\",\"tone_name\":\"Tentative\",\"score\":0}],\"category_id\":\"language_tone\",\"category_name\":\"Language Tone\"},{\"tones\":[{\"tone_id\":\"openness_big5\",\"tone_name\":\"Openness\",\"score\":0.20687},{\"tone_id\":\"conscientiousness_big5\",\"tone_name\":\"Conscientiousness\",\"score\":0.198762},{\"tone_id\":\"extraversion_big5\",\"tone_name\":\"Extraversion\",\"score\":0.09639},{\"tone_id\":\"agreeableness_big5\",\"tone_name\":\"Agreeableness\",\"score\":0.573345},{\"tone_id\":\"emotional_range_big5\",\"tone_name\":\"Emotional Range\",\"score\":0.06478}],\"category_id\":\"social_tone\",\"category_name\":\"Social Tone\"}],\"input_from\":0,\"sentence_id\":0,\"text\":\"I know the times are difficult!\",\"input_to\":31},{\"tone_categories\":[{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.072558},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.022583},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.07614799999999999},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.013483},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.635673}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"},{\"tones\":[{\"tone_id\":\"analytical\",\"tone_name\":\"Analytical\",\"score\":0.506763},{\"tone_id\":\"confident\",\"tone_name\":\"Confident\",\"score\":0},{\"tone_id\":\"tentative\",\"tone_name\":\"Tentative\",\"score\":0}],\"category_id\":\"language_tone\",\"category_name\":\"Language Tone\"},{\"tones\":[{\"tone_id\":\"openness_big5\",\"tone_name\":\"Openness\",\"score\":0.07091699999999999},{\"tone_id\":\"conscientiousness_big5\",\"tone_name\":\"Conscientiousness\",\"score\":0.474335},{\"tone_id\":\"extraversion_big5\",\"tone_name\":\"Extraversion\",\"score\":0.433797},{\"tone_id\":\"agreeableness_big5\",\"tone_name\":\"Agreeableness\",\"score\":0.221349},{\"tone_id\":\"emotional_range_big5\",\"tone_name\":\"Emotional Range\",\"score\":0.818751}],\"category_id\":\"social_tone\",\"category_name\":\"Social Tone\"}],\"input_from\":32,\"sentence_id\":1,\"text\":\"Our sales have been disappointing for the past three quarters for our data analytics product suite.\",\"input_to\":131},{\"tone_categories\":[{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.028398},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.011664},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.055983},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.093237},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.137565}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"},{\"tones\":[{\"tone_id\":\"analytical\",\"tone_name\":\"Analytical\",\"score\":0.653099},{\"tone_id\":\"confident\",\"tone_name\":\"Confident\",\"score\":0},{\"tone_id\":\"tentative\",\"tone_name\":\"Tentative\",\"score\":0}],\"category_id\":\"language_tone\",\"category_name\":\"Language Tone\"},{\"tones\":[{\"tone_id\":\"openness_big5\",\"tone_name\":\"Openness\",\"score\":0.143065},{\"tone_id\":\"conscientiousness_big5\",\"tone_name\":\"Conscientiousness\",\"score\":0.312681},{\"tone_id\":\"extraversion_big5\",\"tone_name\":\"Extraversion\",\"score\":0.687347},{\"tone_id\":\"agreeableness_big5\",\"tone_name\":\"Agreeableness\",\"score\":0.351194},{\"tone_id\":\"emotional_range_big5\",\"tone_name\":\"Emotional Range\",\"score\":0.678823}],\"category_id\":\"social_tone\",\"category_name\":\"Social Tone\"}],\"input_from\":132,\"sentence_id\":2,\"text\":\"We have a competitive data analytics product suite in the industry.\",\"input_to\":199},{\"tone_categories\":[{\"tones\":[{\"tone_id\":\"anger\",\"tone_name\":\"Anger\",\"score\":0.06554599999999999},{\"tone_id\":\"disgust\",\"tone_name\":\"Disgust\",\"score\":0.105347},{\"tone_id\":\"fear\",\"tone_name\":\"Fear\",\"score\":0.551442},{\"tone_id\":\"joy\",\"tone_name\":\"Joy\",\"score\":0.019003},{\"tone_id\":\"sadness\",\"tone_name\":\"Sadness\",\"score\":0.120215}],\"category_id\":\"emotion_tone\",\"category_name\":\"Emotion Tone\"},{\"tones\":[{\"tone_id\":\"analytical\",\"tone_name\":\"Analytical\",\"score\":0},{\"tone_id\":\"confident\",\"tone_name\":\"Confident\",\"score\":0},{\"tone_id\":\"tentative\",\"tone_name\":\"Tentative\",\"score\":0}],\"category_id\":\"language_tone\",\"category_name\":\"Language Tone\"},{\"tones\":[{\"tone_id\":\"openness_big5\",\"tone_name\":\"Openness\",\"score\":0.078972},{\"tone_id\":\"conscientiousness_big5\",\"tone_name\":\"Conscientiousness\",\"score\":0.636498},{\"tone_id\":\"extraversion_big5\",\"tone_name\":\"Extraversion\",\"score\":0.324515},{\"tone_id\":\"agreeableness_big5\",\"tone_name\":\"Agreeableness\",\"score\":0.488792},{\"tone_id\":\"emotional_range_big5\",\"tone_name\":\"Emotional Range\",\"score\":0.7672020000000001}],\"category_id\":\"social_tone\",\"category_name\":\"Social Tone\"}],\"input_from\":200,\"sentence_id\":3,\"text\":\"But we need to do our job selling it!\",\"input_to\":237}]}"
    

}

