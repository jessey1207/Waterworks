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

    var gridIndex: Int? {
        switch self {
        case .SE:
            return 0
        case .S:
            return 1
        case .SW:
            return 2
        case .E:
            return 3
        case .W:
            return 5
        case .NE:
            return 6
        case .N:
            return 7
        case .NW:
            return 8
        case .unknown:
            return nil
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
