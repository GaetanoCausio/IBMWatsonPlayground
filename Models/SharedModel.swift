//
//  GenericModels.swift
//  IBMWatsonPlayground
//
//  Created by Gaetano Causio on 23/05/2017.
//  Copyright © 2017 Gaetano Causio. All rights reserved.
//

import Foundation

/** The score given a name and an amount. May be used by serveral services */
public struct ItemScore {
    
    /// The name of this particular item.
    public let name: String
    
    /// The raw score of this item, computed by the algorithms. 
    public let score: Double
    
}
