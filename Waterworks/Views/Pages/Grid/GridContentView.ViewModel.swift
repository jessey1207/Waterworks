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
        
        init(
            userInput: GridUserInput,
            isRotated: Bool
        ) {
            self.isRotated = isRotated
            self.isSaved = LocalStorage.savedUserInputs.contains(where: { $0 == userInput })
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
        isSaved = LocalStorage.savedUserInputs.contains(where: { $0 == userInput })
    }
    
    func didTapSaveButton(userInput: GridUserInput) {
        // TODO: Modal
        if isSaved {
            // Remove from local storage
            LocalStorage.savedUserInputs.removeAll(where: { $0 == userInput })
        } else {
            // Add to local storage
            LocalStorage.savedUserInputs.append(userInput)
        }
        isSaved.toggle()
    }
}
