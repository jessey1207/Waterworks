//
//  PageView.ViewModel.swift
//  Waterworks
//
//  Created by Jessey Fung on 25/3/2023.
//

import Foundation

extension PageView {
    final class ViewModel: ObservableObject {
        @Published var savedConfigurations: [SavedConfiguration] = []
        
        let currentPage: ContentView.Page
        
        init(currentPage: ContentView.Page) {
            self.currentPage = currentPage
            self.savedConfigurations = localStorageConfigurationsSorted
        }
        
        func onAppearSavedPage() {
            savedConfigurations = localStorageConfigurationsSorted
        }
    }
}

private extension PageView.ViewModel {
    var localStorageConfigurationsSorted: [SavedConfiguration] {
        LocalStorage.savedConfigurations.sorted(by: {
            $0.name.lowercased() < $1.name.lowercased()
        })
    }
}
