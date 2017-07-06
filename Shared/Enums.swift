//
//  Enums.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 06/07/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation

enum ToneAnalysisError: Error {
    case unableToParseJSON
    case serviceInitializationError(ServiceName: String)
}


