//
//  Collection+Extensions.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

extension Array {
    /// Rearranged array to replicate the action of rotating the grid.
    ///
    /// - Parameter direction: The direction to determine how to rearrange (i.e. how much to rotate).
    func rearranged(for direction: Direction) -> Self {
        guard direction != .unknown else { return self }
        var new: [Element?] = .init(repeating: nil, count: 9)
        for index in 0..<9 {
            new[index] = self[direction.indexModifier[index]]
        }
        return new.compactMap { $0 }
    }
}

private extension Direction {
    var indexModifier: [Int] {
        switch self.cardinalPoint {
        case .S:
            return [0, 1, 2, 3, 4, 5, 6, 7, 8]
        case .SW:
            return [1, 2, 5, 0, 4, 8, 3, 6, 7]
        case .W:
            return [2, 5, 8, 1, 4, 7, 0, 3, 6]
        case .NW:
            return [5, 8, 7, 2, 4, 6, 1, 0, 3]
        case .N:
            return [8, 7, 6, 5, 4, 3, 2, 1, 0]
        case .NE:
            return [7, 6, 3, 8, 4, 0, 5, 2, 1]
        case .E:
            return [6, 3, 0, 7, 4, 1, 8, 5, 2]
        case .SE:
            return [3, 0, 1, 6, 4, 2, 7, 8, 5]
        case .unknown:
            return []
        }
    }
}
