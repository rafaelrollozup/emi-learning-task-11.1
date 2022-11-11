//
//  Typography+UIFont.swift
//  LearningTask-11.1
//
//  Created by rafael.rollo on 11/11/2022.
//

import UIKit

enum HelveticaNeueFonts: String {
    case regular = "HelveticaNeue"
    case italic = "HelveticaNeue-Italic"
    case ultraLight = "HelveticaNeue-UltraLight"
    case ultraLightItalic = "HelveticaNeue-UltraLightItalic"
    case thin = "HelveticaNeue-Thin"
    case thinItalic = "HelveticaNeue-ThinItalic"
    case light = "HelveticaNeue-Light"
    case lightItalic = "HelveticaNeue-LightItalic"
    case medium = "HelveticaNeue-Medium"
    case mediumItalic = "HelveticaNeue-MediumItalic"
    case bold = "HelveticaNeue-Bold"
    case boldItalic = "HelveticaNeue-BoldItalic"
    case condensedBold = "HelveticaNeue-CondensedBold"
    case condensedBlack = "HelveticaNeue-CondensedBlack"
}

extension UIFont {
    static func helveticaNeue(_ font: HelveticaNeueFonts = .regular, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: font.rawValue, size: size) else {
            fatalError("Failed to load the HelveticaNeue font.")
        }

        return UIFontMetrics.default.scaledFont(for: font)
    }
}
