//
//  GridContentView.ViewModel.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import Foundation

extension GridContentView {
    class ViewModel: ObservableObject {
        @Published var isRotated: Bool
        @Published var isSaved: Bool
        @Published var sheet: Sheet?
        
        enum Sheet: String, Identifiable {
            case save
            
            var id: String { rawValue }
        }
        
        init(
            userInput: GridUserInput,
            isRotated: Bool
        ) {
            self.isRotated = isRotated
            self.isSaved = LocalStorage.savedConfigurations.contains(where: { $0.userInput == userInput })
        }
    }
}

extension GridContentView.ViewModel {
    var saveButtonImageName: String {
        return isSaved
        ? Constants.Save.Button.savedImageName
        : Constants.Save.Button.unsavedImageName
    }
    
    func didUpdateUserInput(_ userInput: GridUserInput) {
        isSaved = LocalStorage.savedConfigurations.contains(where: { $0.userInput == userInput })
    }
    
    func didTapSaveButton(userInput: GridUserInput) {
        if isSaved {
            LocalStorage.savedConfigurations.removeAll(where: { $0.userInput == userInput })
            isSaved = false
            // TODO: Alert
        } else {
            sheet = .save
        }
    }
    
    func save(configuration: SavedConfiguration) {
        LocalStorage.savedConfigurations.append(configuration)
        isSaved = true
        sheet = nil
    }
}
