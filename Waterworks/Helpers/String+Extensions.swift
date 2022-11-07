//
//  String+Extensions.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import Foundation

extension String {
    /// Returns translation of number (1-9 inclusive) to Chinese characters.
    func translatedToChinese() -> Self {
        switch self {
        case "1": return "一"
        case "2": return "二"
        case "3": return "三"
        case "4": return "四"
        case "5": return "五"
        case "6": return "六"
        case "7": return "七"
        case "8": return "八"
        case "9": return "九"
        default: return self
        }
    }
}
