//
//  SavedCalculation.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/3/2023.
//

import Foundation

struct SavedCalculation: Identifiable {
    let name: String
    let userInput: GridUserInput
    let coordinates: Coordinates = .init(latitude: 0, longitude: 0)
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
    
    var id: String { name }
}
