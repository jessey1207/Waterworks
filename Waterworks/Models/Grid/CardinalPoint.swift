//
//  CardinalPoint.swift
//  Waterworks
//
//  Created by Jessey Fung on 20/4/22.
//

import Foundation

enum CardinalPoint: Int, CaseIterable {
    case SE = 0
    case S = 1
    case SW = 2
    case E = 3
    case W = 5
    case NE = 6
    case N = 7
    case NW = 8
    case unknown = -1

    var gridIndex: Int? {
        switch self {
        case .unknown:
            return nil
        default:
            return rawValue
        }
    }

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
