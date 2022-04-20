//
//  Collection+Extensions.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

extension Array where Element == GridItemModel {
    /// Rearranged array to replicate the action of rotating the grid.
    ///
    /// - Parameter direction: The direction to determine how to rearrange (i.e. how much to rotate).
    func rearranged(for direction: Direction) -> Self {
        guard direction != .unknown else { return self }
        var new: [GridItemModel?] = .init(repeating: nil, count: 9)
        for index in 0..<9 {
            new[direction.indexModifier[index]] = self[index]
        }
        return new.compactMap { $0 }
    }
}

private extension Direction {
    var indexModifier: [Int] {
        switch self {
        case .丙, .午, .丁: // S
            return [0, 1, 2, 3, 4, 5, 6, 7, 8]
        case .未, .坤, .申: // SW
            return [1, 2, 5, 0, 4, 8, 3, 6, 7]
        case .庚, .酉, .辛: // W
            return [2, 5, 8, 1, 4, 7, 0, 3, 6]
        case .成, .乾, .亥: // NW
            return [5, 8, 7, 2, 4, 6, 1, 0, 3]
        case .壬, .子, .癸: // N
            return [8, 7, 6, 5, 4, 3, 2, 1, 0]
        case .丑, .艮, .寅: // NE
            return [7, 6, 3, 8, 4, 0, 5, 2, 1]
        case .甲, .卯, .乙: // E
            return [6, 3, 0, 7, 4, 1, 8, 5, 2]
        case .辰, .巽, .巳: // SE
            return [3, 0, 1, 6, 4, 2, 7, 8, 5]
        case .unknown:
            return []
        }
    }
}
