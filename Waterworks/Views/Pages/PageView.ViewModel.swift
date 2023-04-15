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
    }
}

// MARK: - Internal

extension PageView.ViewModel {
    var favouritedConfigurations: [SavedConfiguration] {
        savedConfigurations.filter { $0.isFavourited }
    }
    
    var unfavouritedConfigurations: [SavedConfiguration] {
        savedConfigurations.filter { !$0.isFavourited }
    }
    
    func onAppearSavedPage() {
        savedConfigurations = localStorageConfigurationsSorted
    }
    
    func onDelete(indexSet: IndexSet) {
        indexSet.forEach { index in
            let removedConfiguration = savedConfigurations.remove(at: index)
            onDelete(configuration: removedConfiguration)
        }
    }
    
    func onDelete(configuration: SavedConfiguration) {
        savedConfigurations.removeAll(where: { $0.name == configuration.name })
        LocalStorage.savedConfigurations.removeAll(where: { $0.name == configuration.name })
    }
}

// MARK: - Private

private extension PageView.ViewModel {
    var localStorageConfigurationsSorted: [SavedConfiguration] {
        LocalStorage.savedConfigurations.sorted(by: {
            $0.name.lowercased() < $1.name.lowercased()
        })
    }
}
