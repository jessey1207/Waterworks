//
//  BaseNumber.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

class UserInput: ObservableObject {

    // Directional picker grid
    @Published var luck: Luck = .unknown
    @Published var location: Location = .unknown

    var direction: Direction { location.direction }
    
    // Year picker grid
    @Published var year: Year = Year(number: Calendar.current.component(.year, from: Date()))

    // Validate
    var isInvalid: Bool {
        return luck == .unknown || location == .unknown || direction == .unknown
    }
}
