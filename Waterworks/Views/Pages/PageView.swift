//
//  PageView.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import SwiftUI

struct PageView: View {
    var currentPage: ContentView.Page
    
    var body: some View {
        Group {
            if currentPage == .home {
                Color.red
            } else if currentPage == .about {
                Color.orange
            } else if currentPage == .gridGenerator {
                GridContentView()
            } else if currentPage == .contact {
                Color.green
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(currentPage: .home)
    }
}
