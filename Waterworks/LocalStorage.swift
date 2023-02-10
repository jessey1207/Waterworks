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
}
