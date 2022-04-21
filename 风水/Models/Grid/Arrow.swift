//
//  Arrow.swift
//  风水
//
//  Created by Jessey Fung on 20/4/22.
//

import Foundation

enum Arrow {
    case topLeft
    case top
    case topRight
    case left
    case right
    case bottomLeft
    case bottom
    case bottomRight

    /// The cardinal point represented by the arrow
    var cardinalPoint: CardinalPoint {
        switch self {
        case .topLeft:
            return .SE
        case .top:
            return .S
        case .topRight:
            return .SW
        case .left:
            return .E
        case .right:
            return .W
        case .bottomLeft:
            return .NE
        case .bottom:
            return .N
        case .bottomRight:
            return .NW
        }
    }
}
