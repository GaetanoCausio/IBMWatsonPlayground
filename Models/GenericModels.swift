//
//  GenericModels.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 23/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation

/** The score given a name and an amount. May be used by serveral services */
public struct NameScore {
    
    /// The name of this particular tone.
    public let name: String
    
    /// The raw score of the tone, computed by the algorithms. This can be
    /// compared to other raw scores and used to build your own normalizations.
    public let score: Double
    
}
