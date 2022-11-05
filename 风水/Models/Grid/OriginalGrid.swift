//
//  OriginalGridModel.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

/// The Original Grid to refer to when calculating location items and direction items.
struct OriginalGrid {
    private let items = GridFormula.clockwise.generateGridItems(center: 5)

    
    /// Retrieves a specific location from the Original Grid.
    ///
    /// - Parameters:
    ///   - number: The grid number containing the location.
    ///   - index: The index of the location.
    func getLocation(from number: Int, at index: Int) -> Location {
        let item = items.first(where: { $0.number == number })
        guard let item = item else {
            return .unknown
        }
        return item.locations[index]
    }

    /// Retrieves a specific direction from the Original Grid.
    ///
    /// - Parameters:
    ///   - number: The grid number containing the direction.
    ///   - index: The index of the direction.
    func getDirection(from number: Int, at index: Int) -> Direction {
        let item = items.first(where: { $0.number == number })
        guard let item = item else {
            return .unknown
        }
        return item.directions[index]
    }
}
