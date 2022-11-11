//
//  DecodingFormattedDates+JSONDecoder.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 17/11/2022.
//

import Foundation

extension JSONDecoder {
    
    convenience init(dateDecodingStrategy: JSONDecoder.DateDecodingStrategy) {
        self.init()
        self.dateDecodingStrategy = dateDecodingStrategy
    }
    
}
