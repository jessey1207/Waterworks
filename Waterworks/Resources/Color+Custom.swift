//
//  Color+Custom.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

extension Color {
    static func custom(_ customColor: CustomColor) -> Color {
        Color(customColor.assetName).opacity(customColor.opacity)
    }
}

enum CustomColor {
    case blueBackground
    case greenBackground
    case goldBackground
    case bronzeBackground
    case redBackground
    case grayBackground
    
    case brownPrimary
    case brownSecondary
    case grayBlue
    case darkGreen
    case red
    case gold
    case bronze

    var assetName: String {
        switch self {
        case .blueBackground:
            return "PastelBlue"
        case .greenBackground:
            return "PastelGreen"
        case .goldBackground:
            return "Gold"
        case .bronzeBackground,
                .bronze:
            return "Bronze"
        case .redBackground,
                .red:
            return "DarkRed"
        case .grayBackground:
            return "PastelGray"
        case .brownPrimary:
            return "DarkBrown"
        case .brownSecondary:
            return "LightBrown"
        case .gold:
            return "Gold"
        case .grayBlue:
            return "GrayBlue"
        case .darkGreen:
            return "DarkGreen"
        }
    }
    
    var opacity: CGFloat {
        switch self {
        case .blueBackground,
                .goldBackground,
                .greenBackground,
                .grayBackground:
           return  0.3
        case .bronzeBackground:
            return 0.2
        case .redBackground:
            return 0.05
        case .brownPrimary,
                .brownSecondary,
                .gold,
                .bronze,
                .red,
                .grayBlue,
                .darkGreen:
            return 1
        }
    }
}
