//
//  CardinalPoint.swift
//  风水
//
//  Created by Jessey Fung on 20/4/22.
//

import Foundation

enum CardinalPoint: CaseIterable {
    case SE, S, SW, E, W, NE, N, NW
    case unknown

    var chineseRepresentation: String {
        switch self {
        case .SE:
            return "巽"
        case .S:
            return "离"
        case .SW:
            return "坤"
        case .E:
            return "震"
        case .W:
            return "兌"
        case .NE:
            return "艮"
        case .N:
            return "坎"
        case .NW:
            return "乾"
        case .unknown:
            return "?"
        }
    }
}
