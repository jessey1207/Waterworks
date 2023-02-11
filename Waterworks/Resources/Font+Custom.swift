//
//  FontExtensions.swift
//  Waterworks
//
//  Created by Jessey Fung on 4/2/2023.
//

import SwiftUI

private let isPad = UIDevice.current.userInterfaceIdiom == .pad

extension Font {
    static func custom(_ customFont: CustomFont) -> Font {
        .custom(customFont.fontName, size: customFont.size)
    }
}

enum CustomFont {
    case title
    case bodyPrimaryBold
    case bodySecondary
    case bodySecondaryBold
    case caption
    case control
    
    var fontName: String {
        switch self {
        case .title,
                .bodySecondary,
                .caption,
                .control:
            return "Philosopher-Regular"
        case .bodyPrimaryBold,
                .bodySecondaryBold:
            return "Philosopher-Bold"
        }
    }
    
    var size: CGFloat {
        switch self {
        case .title:
            return isPad ? 32 : 24
        case .bodyPrimaryBold:
            return isPad ? 24 : 17
        case .bodySecondary, .bodySecondaryBold:
            return isPad ? 24 : 14
        case .caption:
            return isPad ? 16 : 12
        case .control:
            return isPad ? 14 : 11
        }
    }
}
