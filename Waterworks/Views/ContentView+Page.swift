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
        case about
        case gridGenerator
        case contact
        
        var buttonImage: Image {
            switch self {
            case .home:
                return Image(systemName: "house")
            case .about:
                return Image(systemName: "person")
            case .gridGenerator:
                return Image(systemName: "square.grid.3x3.fill")
            case .contact:
                return Image(systemName: "iphone.homebutton")
            }
        }
        
        var name: String {
            switch self {
            case .home:
                return "Home"
            case .about:
                return "About"
            case .gridGenerator:
                return "Grid"
            case .contact:
                return "Contact"
            }
        }
        
        var id: Int { self.rawValue }
    }
}
