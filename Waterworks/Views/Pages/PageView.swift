//
//  PageView.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import SwiftUI

struct PageView: View {
    var currentPage: ContentView.Page
    
    let savedConfigurations: [SavedConfiguration] = LocalStorage.savedConfigurations
    
    var body: some View {
        switch currentPage {
        case .calculator:
            GridContentView()
                .edgesIgnoringSafeArea(.top)
        case .saved, .favourites:
            List(savedConfigurations) { configuration in
                NavigationLink {
                    // TODO: detail view
                } label: {
                    Text(configuration.name)
                }
                .listStyle(.insetGrouped)
                .background(currentPage.backgroundColor.opacity(0.25))
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(currentPage: .calculator)
    }
}
