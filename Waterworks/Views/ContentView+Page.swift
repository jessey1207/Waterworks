//
//  ContentView+Page.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

extension ContentView {
    enum Page: Int, CaseIterable, Identifiable {
        case calculator
        case saved
        case favourites
        
        var textColor: Color {
            return .custom(.grayBlue)
        }
        
        var backgroundColor: Color {
            switch self {
            case .calculator: return .custom(.bronzeBackground)
            case .saved: return .custom(.redBackground)
            case .favourites: return .custom(.goldBackground)
            }
        }
        
        var buttonTitle: String {
            switch self {
            case .calculator: return Strings.Calculator.buttonTitle
            case .saved: return Strings.Saved.buttonTitle
            case .favourites: return Strings.Favourites.buttonTitle
            }
        }
        
        var buttonImage: Image {
            switch self {
            case .calculator:
                return Image(systemName: "square.grid.3x3.fill")
            case .saved:
                return Image(systemName: "suit.heart.fill")
            case .favourites:
                return Image(systemName: "star.fill")
            }
        }
        
        var id: Int { self.rawValue }
    }
}
