//
//  LocalStorage.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import Foundation

class LocalStorage {
    enum Keys {
        static let userInputLuck: String = "userInput_luck"
        static let userInputLocation: String = "userInput_location"
        static let userInputYear: String = "userInput_year"
        static let savedGridUserInputs: String = "saved_grid_user_inputs"
    }
    
    static var luck: Luck {
        get {
            guard let stored = UserDefaults.standard.value(forKey: Keys.userInputLuck) as? Int else { return .unknown }
            return Luck(rawValue: stored) ?? .unknown
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.userInputLuck)
        }
    }
    
    static var location: Location {
        get {
            guard let stored = UserDefaults.standard.value(forKey: Keys.userInputLocation) as? String else { return .unknown }
            return Location(rawValue: stored) ?? .unknown
        }
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: Keys.userInputLocation)
        }
    }
    
    static var year: Year {
        get {
            guard let stored = UserDefaults.standard.value(forKey: Keys.userInputYear) as? Int else {
                return .init(number: Calendar.current.component(.year, from: Date()))
            }
            return Year(number: stored)
        }
        set {
            UserDefaults.standard.set(newValue.number, forKey: Keys.userInputYear)
        }
    }
    
    static var savedUserInputs: [GridUserInput] {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.savedGridUserInputs) else { return [] }
            let decodedData = try? JSONDecoder().decode([GridUserInputItem].self, from: data)
            return decodedData?.map {
                .init(
                    luck: Luck(rawValue: $0.luck) ?? .unknown,
                    location: Location(rawValue: $0.location) ?? .unknown,
                    year: Year(number: $0.year)
                )
            } ?? []
        }
        set {
            let items: [GridUserInputItem] = newValue.map { .init(from: $0) }
            let encoded = try? JSONEncoder().encode(items)
            UserDefaults.standard.set(encoded, forKey: Keys.savedGridUserInputs)
        }
    }
    
    // MARK: - Codable
    
    private struct GridUserInputItem: Codable {
        let luck: Int
        let location: String
        let year: Int
        
        init(from userInput: GridUserInput) {
            self.luck = userInput.luck.rawValue
            self.location = userInput.location.rawValue
            self.year = userInput.year.number
        }
    }
}
