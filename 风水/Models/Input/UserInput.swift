//
//  BaseNumber.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

class UserInput: ObservableObject {
    @Published var luck: Luck = .unknown
    @Published var location: Location = .unknown

    var direction: Direction { location.direction }

    var isInvalid: Bool {
        return luck == .unknown || location == .unknown || direction == .unknown
    }
}
