//
//  CompassView.ViewModel.swift
//  Waterworks
//
//  Created by Jessey Fung on 29/7/2023.
//

import Foundation

extension CompassView {
    final class ViewModel: ObservableObject, Equatable {
        @Published var topPoint: CardinalPoint
        @Published var topLeftPoint: CardinalPoint
        @Published var leftPoint: CardinalPoint
        @Published var bottomLeftPoint: CardinalPoint
        @Published var bottomPoint: CardinalPoint
        @Published var bottomRightPoint: CardinalPoint
        @Published var rightPoint: CardinalPoint
        @Published var topRightPoint: CardinalPoint
        
        init(
            userInput: GridUserInput,
            rotatedPoint: CardinalPoint
        ) {
            // Rotations are based off of the user input's direction.
            // So the `rotateCount` is calculated from direction to `rotatedPoint`.
            let currentDirection = userInput.direction.cardinalPoint
            let rotateCount = currentDirection.getRotateCount(to: rotatedPoint)
            
            topPoint = .S.rotated(by: rotateCount)
            topLeftPoint = .SE.rotated(by: rotateCount)
            leftPoint = .E.rotated(by: rotateCount)
            bottomLeftPoint = .NE.rotated(by: rotateCount)
            bottomPoint = .N.rotated(by: rotateCount)
            bottomRightPoint = .NW.rotated(by: rotateCount)
            rightPoint = .W.rotated(by: rotateCount)
            topRightPoint = .SW.rotated(by: rotateCount)
        }
        
        static func == (lhs: CompassView.ViewModel, rhs: CompassView.ViewModel) -> Bool {
            lhs.topPoint == rhs.topPoint
            && lhs.topLeftPoint == rhs.topLeftPoint
            && lhs.leftPoint == rhs.leftPoint
            && lhs.bottomLeftPoint == rhs.bottomLeftPoint
            && lhs.bottomPoint == rhs.bottomPoint
            && lhs.bottomRightPoint == rhs.bottomRightPoint
            && lhs.rightPoint == rhs.rightPoint
            && lhs.topRightPoint == rhs.topRightPoint
        }
    }
}

private extension CardinalPoint {
    /// Anticlockwise rotation.
    func rotated(by count: Int) -> Self {
        let reference: [CardinalPoint] = [.S, .SW, .W, .NW, .N, .NE, .E, .SE]
        let index = reference.firstIndex(where: { $0 == self })
        
        guard let index else { return self }
        return reference[(index + count) % reference.count]
    }
}
