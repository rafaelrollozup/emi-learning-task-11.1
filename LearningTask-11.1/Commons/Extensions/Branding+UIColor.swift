//
//  Branding+UIColor.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

extension UIColor {
    static var copper: UIColor = .init(named: "Copper") ?? .systemBrown
    static var flamePea: UIColor = .init(named: "Flame Pea") ?? .systemRed
    static var mariner: UIColor = .init(named: "Mariner") ?? .systemBlue
}
    
extension UIColor {
    static func of(_ language: String) -> UIColor {
        switch language {
        case "Java":
            return .copper
            
        case "Swift":
            return .flamePea
            
        default:
            return .secondaryLabel
        }
    }
}
