//
//  GridItemNumber.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

/// The model behind every grid item.
struct GridItemModel: Equatable {

    /// The number to be displayed in the grid.
    let number: Int

    /// The associated locations.
    let locations: [Location]

    /// The associated directions.
    var directions: [Direction] {
        locations.map { location in
            Direction(rawValue: location.rawValue) ?? .unknown
        }
    }
}
