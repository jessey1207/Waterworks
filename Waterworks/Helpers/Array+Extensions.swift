//
//  Collection+Extensions.swift
//  Waterworks
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

extension Array {
    /// Returns a rearranged array to replicate the action of rotating from one ``CardinalPoint`` to another.
    func rotated(from current: CardinalPoint, to target: CardinalPoint) -> Self {
        var mutable = self
        for _ in 0..<current.getRotateCount(to: target) {
            mutable.rotateOnce()
        }
        return mutable
    }
    
    private mutating func rotateOnce() {
        let matrix: [[Element]] = [
            [self[0], self[1], self[2]],
            [self[3], self[4], self[5]],
            [self[6], self[7], self[8]]
        ]
        let rotatedMatrix = [
            [matrix[0][1], matrix[0][2], matrix[1][2]],
            [matrix[0][0], matrix[1][1], matrix[2][2]],
            [matrix[1][0], matrix[2][0], matrix[2][1]]
        ]
        self = rotatedMatrix.flatMap { $0 }
    }
}

extension CardinalPoint {
    /// Calculates how many rotations it takes to get to the target ``CardinalPoint``.
    /// - Warning: Calculations are based on **anti-clockwise** rotations.
    func getRotateCount(to target: CardinalPoint) -> Int {
        guard let currentIndex = normalizedRotationIndex,
              let targetIndex = target.normalizedRotationIndex
        else { return 0 }
        let count = currentIndex - targetIndex
        return count < 0 ? count + 8 : count
    }
    
    private var normalizedRotationIndex: Int? {
        switch self {
        case .SE:
            return [0, 7, 6, 1, 5, 2, 3, 4][4]
        case .S:
            return [1, 0, 7, 2, 6, 3, 4, 5][4]
        case .SW:
            return [2, 1, 0, 3, 7, 4, 5, 6][4]
        case .E:
            return [7, 6, 5, 0, 4, 1, 2, 3][4]
        case .W:
            return [3, 2, 1, 4, 0, 5, 6, 7][4]
        case .NE:
            return [6, 5, 4, 7, 3, 0, 1, 2][4]
        case .N:
            return [5, 4, 3, 6, 2, 7, 0, 1][4]
        case .NW:
            return [4, 3, 2, 5, 1, 6, 7, 0][4]
        case .unknown:
            return nil
        }
    }
}
