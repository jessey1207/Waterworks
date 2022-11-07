//
//  GridFormula.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import Foundation

enum GridFormula {
    case clockwise
    case anticlockwise

    /// Generates an array of 9 grid item models to fill the 3x3 grid.
    /// The array fills the grid top-down and left-right.
    ///
    /// - Parameter number: Center number.
    /// - Returns: Array of 9 `GridItemModel`.
    func generateGridItems(center number: Int) -> [GridItemModel] {
        modifiers.enumerated().map { index, modifier -> GridItemModel in
            let modified = (number + modifier) % 9
            let n = modified == 0 ? 9 : modified
            let model = GridItemModel(
                number: n,
                locations: locations(forGridItemAt: index)
            )
            return model
        }
    }

    // MARK: - Private helpers

    private var modifiers: [Int] {
        switch self {
        case .clockwise:
            return [8, 4, 6, 7, 0, 2, 3, 5, 1]
        case .anticlockwise:
            return [1, 5, 3, 2, 0, 7, 6, 4, 8]
        }
    }

    private func locations(forGridItemAt index: Int) -> [Location] {
        // Grid item at index 4 has no locations, so need to shift the indexes that are >4
        guard index != 4 else { return [] }
        let shift = index > 4 ? 3 : 0
        return [
            Location.allCases[index * 3 - shift],
            Location.allCases[index * 3 + 1 - shift],
            Location.allCases[index * 3 + 2 - shift]
        ]
        
    }
}
