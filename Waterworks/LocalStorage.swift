//
//  LocalStorage.swift
//  Waterworks
//
//  Created by Jessey Fung on 11/2/2023.
//

import Foundation
import MapKit

class LocalStorage {
    enum Keys {
        static let userInputLuck: String = "userInput_luck"
        static let userInputLocation: String = "userInput_location"
        static let userInputYear: String = "userInput_year"
        static let savedConfigurations: String = "saved_configurations"
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
    
    static var savedConfigurations: [SavedConfiguration] {
        get {
            guard let data = UserDefaults.standard.data(forKey: Keys.savedConfigurations) else { return [] }
            let decodedData = try? JSONDecoder().decode([SavedConfigurationItem].self, from: data)
            return decodedData?.map {
                .init(from: $0)
            } ?? []
        }
        set {
            let items: [SavedConfigurationItem] = newValue.map { .init(from: $0) }
            let encoded = try? JSONEncoder().encode(items)
            UserDefaults.standard.set(encoded, forKey: Keys.savedConfigurations)
        }
    }
    
    // MARK: - Codable
    
    struct SavedConfigurationItem: Codable {
        let name: String
        let userInput: GridUserInputItem
        let location: LocationItem?
        let placeName: String?
        let notes: String
        let isFavourited: Bool
        
        init(from configuration: SavedConfiguration) {
            self.name = configuration.name
            self.userInput = .init(from: configuration.userInput)
            self.location = .init(
                latitude: configuration.location?.coordinate.latitude,
                longitude: configuration.location?.coordinate.longitude
            )
            self.placeName = configuration.placeName
            self.notes = configuration.notes
            self.isFavourited = configuration.isFavourited
        }
        
        struct GridUserInputItem: Codable {
            let luck: Int
            let location: String
            let year: Int
            
            init(from userInput: GridUserInput) {
                self.luck = userInput.luck.rawValue
                self.location = userInput.location.rawValue
                self.year = userInput.year.number
            }
        }
        
        struct LocationItem: Codable {
            let latitude: Double
            let longitude: Double
            
            init?(latitude: Double?, longitude: Double?) {
                guard let latitude, let longitude else { return nil }
                self.latitude = latitude
                self.longitude = longitude
            }
        }
    }
}
