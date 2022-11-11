//
//  CustomPatterns+DateFormatter.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import Foundation

extension DateFormatter {
    
    private static var dayPlusAbbreviatedMonthFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMM dd yyyy"
        
        return formatter
    }()
    
    enum CustomPattern {
        case dayPlusAbbreviatedMonth
        
        var formatter: DateFormatter {
            switch self {
            case .dayPlusAbbreviatedMonth:
                return DateFormatter.dayPlusAbbreviatedMonthFormatter
            }
        }
    }
    
    static func format(date: Date, to customPattern: CustomPattern) -> String {
        return customPattern.formatter.string(from: date).uppercased()
    }
    
}
