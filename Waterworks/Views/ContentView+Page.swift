//
//  ContentView+Page.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

extension ContentView {
    enum Page: Int, CaseIterable, Identifiable {
        case home
        case definition
        case furnishing
        case layout
        case calculator
        case contact
        
        var textColor: Color {
            return .custom(.grayBlue)
        }
        
        var backgroundColor: Color {
            switch self {
            case .home: return .custom(.blueBackground)
            case .definition: return .custom(.greenBackground)
            case .furnishing: return .custom(.goldBackground)
            case .layout: return .custom(.grayBackground)
            case .calculator: return .custom(.bronzeBackground)
            case .contact: return .custom(.redBackground)
            }
        }
        
        var buttonImage: Image {
            switch self {
            case .home:
                return Image(systemName: "house")
            case .definition:
                return Image(systemName: "person")
            case .furnishing:
                return Image(systemName: "chair.lounge")
            case .layout:
                return Image(systemName: "map")
            case .calculator:
                return Image(systemName: "square.grid.3x3.fill")
            case .contact:
                return Image(systemName: "iphone.homebutton")
            }
        }
        
        var id: Int { self.rawValue }
    }
}

extension ContentView.Page {
    var buttonTitle: String {
        switch self {
        case .home: return Strings.Home.buttonTitle
        case .definition: return Strings.About.buttonTitle
        case .furnishing: return Strings.Furnishing.buttonTitle
        case .layout: return Strings.Layout.buttonTitle
        case .calculator: return Strings.Calculator.buttonTitle
        case .contact: return Strings.Contact.buttonTitle
        }
    }
    
    var pageTitle: String {
        switch self {
        case .home: return Strings.Home.pageTitle
        case .definition: return Strings.About.pageTitle
        case .furnishing: return Strings.Furnishing.pageTitle
        case .layout: return Strings.Layout.pageTitle
        case .calculator: return ""
        case .contact: return Strings.Contact.pageTitle
        }
    }
    
    var description: String {
        switch self {
        case .home: return Strings.Home.description
        case .definition: return Strings.About.description
        case .furnishing: return Strings.Furnishing.description
        case .layout: return Strings.Layout.description
        case .calculator: return ""
        case .contact: return Strings.Contact.description
        }
    }
    
    var unorderedListTitle: String {
        switch self {
        case .home: return Strings.Home.unorderedListTitle
        case .definition: return Strings.About.unorderedListTitle
        case .furnishing: return Strings.Furnishing.unorderedListTitle
        case .layout: return Strings.Layout.unorderedListTitle
        case .calculator: return ""
        case .contact: return ""
        }
    }
    
    var unorderedList: [String] {
        switch self {
        case .home: return Strings.Home.unorderedList
        case .definition: return Strings.About.unorderedList
        case .furnishing: return Strings.Furnishing.unorderedList
        case .layout: return Strings.Layout.unorderedList
        case .calculator: return []
        case .contact: return []
        }
    }
    
    var conclusion: String {
        switch self {
        case .home: return Strings.Home.conclusion
        case .definition: return Strings.About.conclusion
        case .furnishing: return Strings.Furnishing.conclusion
        case .layout: return Strings.Layout.conclusion
        case .calculator: return ""
        case .contact: return ""
        }
    }
}
