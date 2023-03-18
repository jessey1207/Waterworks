//
//  GridUserInput.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI
import Combine

class GridUserInput: ObservableObject {
    
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
    
    @Published var isAdding: Bool = false
    
    private var bag = Set<AnyCancellable>()
    
    init(
        luck: Luck = LocalStorage.luck,
        location: Location = LocalStorage.location,
        year: Year = LocalStorage.year
    ) {
        self.luck = luck
        self.location = location
        self.year = year
        
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        $luck
            .sink { LocalStorage.luck =  $0 }
            .store(in: &bag)
        $location
            .sink { LocalStorage.location = $0 }
            .store(in: &bag)
        $year
            .sink { LocalStorage.year = $0 }
            .store(in: &bag)
    }
}

// MARK: - Equatable

extension GridUserInput: Equatable {
    static func == (lhs: GridUserInput, rhs: GridUserInput) -> Bool {
        lhs.luck == rhs.luck && lhs.location == rhs.location && lhs.year.number == rhs.year.number
    }
}
