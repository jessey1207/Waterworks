//
//  GridContentView.ViewModel.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import Foundation
import Combine

extension GridContentView {
    class ViewModel: ObservableObject {
        @Published var rotatedPoint: CardinalPoint
        @Published var isSaved: Bool
        @Published var sheet: Sheet?
        @Published var isPresentedUnsaveAlert: Bool = false
        @Published var compassViewModel: CompassView.ViewModel
        
        let mode: Mode
        
        private let userInput: GridUserInput
        private var bag: Set<AnyCancellable> = []
        
        init(
            userInput: GridUserInput,
            mode: Mode
        ) {
            self.rotatedPoint = userInput.direction.cardinalPoint
            self.isSaved = LocalStorage.savedConfigurations.contains(where: { $0.userInput == userInput })
            self.mode = mode
            self.userInput = userInput
            self.compassViewModel = .init(
                userInput: userInput,
                rotatedPoint: userInput.direction.cardinalPoint
            )
            
            $rotatedPoint.sink { [weak self] rotatedPoint in
                self?.compassViewModel = .init(
                    userInput: userInput,
                    rotatedPoint: rotatedPoint
                )
            }
            .store(in: &bag)
        }
    }
}

extension GridContentView.ViewModel {
    var unsaveAlertMessage: String {
        var string = Constants.Save.Alert.messagePrefix
        let savedConfigurationsNames = LocalStorage.savedConfigurations
            .filter { $0.userInput == userInput }
            .map { $0.name }
        savedConfigurationsNames.forEach { name in
            string.append(Constants.Save.Alert.listItem(name: name))
        }
        string.append(Constants.Save.Alert.messageSuffix)
        return string
    }
    
    var saveButtonImageName: String {
        return isSaved
        ? Constants.Save.Button.savedImageName
        : Constants.Save.Button.unsavedImageName
    }
    
    func didUpdateUserInput(_ userInput: GridUserInput) {
        isSaved = LocalStorage.savedConfigurations.contains(where: { $0.userInput == userInput })
        rotatedPoint = userInput.direction.cardinalPoint
    }
    
    func didTapSaveButton(userInput: GridUserInput) {
        if isSaved {
            isPresentedUnsaveAlert = true
        } else {
            sheet = .save
        }
    }
    
    func unsave() {
        LocalStorage.savedConfigurations.removeAll(where: { $0.userInput == userInput })
        isSaved = false
    }
    
    func save(configuration: SavedConfiguration) {
        LocalStorage.savedConfigurations.append(configuration)
        isSaved = true
        sheet = nil
    }
}

// MARK: - Types

extension GridContentView.ViewModel {
    enum Mode {
        /// Allows user to change the grid input and save configuration.
        case edit
        /// Disables grid input and saving. Allows grid rotating and adding.
        case view
    }
    
    enum Sheet: String, Identifiable {
        case save
        
        var id: String { rawValue }
    }
}
