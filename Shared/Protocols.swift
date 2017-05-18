//
//  Protocols.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 16/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation

/*
 Pubblic Interface for all objects used in the application
 */

/// IBM Watson API Credentials

protocol WatsonCredentials {
    static var naturalLanguageUnderstanding:Credentials.WatsonServiceCredentials { get }
    static var languageTranslator:Credentials.WatsonServiceCredentials { get }
    static var speechToText:Credentials.WatsonServiceCredentials { get }
    static var personalityInsights:Credentials.WatsonServiceCredentials { get }
    static var toneAnalyzer:Credentials.WatsonServiceCredentials { get }
    static var textToSpeech:Credentials.WatsonServiceCredentials { get }
    static var visualRecognition:Credentials.WatsonServiceCredentials { get }
}

