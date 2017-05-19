//
//  Credentials.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 16/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation

/*
 Please define here all personal/private data such as credentials
 */

struct Credentials: WatsonCredentials {
    
    // TODO: Please conform to protocol by uncommenting code below so to specify your IBM Watson API credentials:
    
//    static let naturalLanguageUnderstanding = WatsonServiceCredentials(
//        version: watsonDefaultVersion, // specify a date (YYYY-MM-DD) to work on a specific API version
//        username: "Your IBM Watson API username for this service",
//        password: "Your IBM Watson API password for this service",
//        apikey: nil // not used
//    )
//
//    static let languageTranslator = WatsonServiceCredentials(
//        version: nil, // not used
//        username: "Your IBM Watson API username for this service",
//        password: "Your IBM Watson API password for this service",
//        apikey: nil // not used
//    )
//
//    static let speechToText = WatsonServiceCredentials(
//        version: nil, // not used
//        username: "Your IBM Watson API username for this service",
//        password: "Your IBM Watson API password for this service",
//        apikey: nil // not used
//    )
//
//    static let personalityInsights = WatsonServiceCredentials(
//        version: watsonDefaultVersion, // specify a date (YYYY-MM-DD) to work on a specific API version
//        username: "Your IBM Watson API username for this service",
//        password: "Your IBM Watson API password for this service",
//        apikey: nil // not used
//    )
//
//    static let toneAnalyzer = WatsonServiceCredentials(
//        version: watsonDefaultVersion, // specify a date (YYYY-MM-DD) to work on a specific API version
//        username: "Your IBM Watson API username for this service",
//        password: "Your IBM Watson API password for this service",
//        apikey: nil // not used
//    )
//
//    static let textToSpeech = WatsonServiceCredentials(
//        version: nil, // not used
//        username: "Your IBM Watson API username for this service",
//        password: "Your IBM Watson API password for this service",
//        apikey: nil // not used
//    )
//
//    static let visualRecognition = WatsonServiceCredentials(
//        version: watsonDefaultVersion, // specify a date (YYYY-MM-DD) to work on a specific API version
//        username: nil,
//        password: nil,
//        apikey: "Your IBM Watson API Key for this service" // not used
//    )

    // IBM Watson Credential structure, covers all services
    
    struct WatsonServiceCredentials {
        let version:String?
        let username:String?
        let password:String?
        let apikey:String?
    }

    // set IBM Watson default service version
    
    static var watsonDefaultVersion:String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
}

