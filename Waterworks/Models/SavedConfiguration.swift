//
//  SavedConfiguration.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import Foundation
import MapKit

struct SavedConfiguration: Identifiable {
    let name: String
    let userInput: GridUserInput
    let location: CLLocation?
    let placeName: String?
    let notes: String
    
    var id: String { name }
    
    init(
        name: String,
        userInput: GridUserInput,
        location: CLLocation?,
        placeName: String?,
        notes: String
    ) {
        self.name = name
        self.userInput = userInput
        self.location = location
        self.placeName = placeName
        self.notes = notes
    }
    
    init(from item: LocalStorage.SavedConfigurationItem) {
        self.name = item.name
        self.userInput = .init(
            luck: Luck(rawValue: item.userInput.luck) ?? .unknown,
            location: Location(rawValue: item.userInput.location) ?? .unknown,
            year: Year(number: item.userInput.year)
        )
        self.location = {
            guard let latitude = item.location?.latitude,
                  let longitude = item.location?.longitude
            else { return nil }
            return .init(latitude: latitude, longitude: longitude)
        }()
        self.placeName = item.placeName
        self.notes = item.notes
    }
}
