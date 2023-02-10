//
//  Types.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import Foundation

// TODO: Refactor
enum Direction: String, CaseIterable, Identifiable {
    case 辰, 巽, 巳, 丙, 午, 丁, 未, 坤, 申, 甲, 卯, 乙, 庚, 酉, 辛, 丑, 艮, 寅, 壬, 子, 癸, 成, 乾, 亥
    case unknown = "?"

    var id: Direction { self }

    var rotation: GridFormula {
        switch self {
        case .巽, .巳, .丙, .坤, .申, .庚, .乾, .亥, .壬, .艮, .寅, .甲:
            return .clockwise
        case .辰, .午, .丁, .未, .酉, .辛, .成, .子, .癸, .丑, .卯, .乙:
            return .anticlockwise
        case .unknown:
            return .clockwise
        }
    }

    var index: Int {
        switch self {
        case .辰, .丙, .未, .庚, .成, .壬, .丑, .甲:
            return 0
        case .巽, .午, .坤, .酉, .乾, .子, .艮, .卯:
            return 1
        case .巳, .丁, .申, .辛, .亥, .癸, .寅, .乙:
            return 2
        case .unknown:
            return 0
        }
    }
    
    var addNumber: Int {
        switch self {
        case .子, .癸, .甲, .申:
            return 1
        case .壬, .卯, .乙, .未, .坤:
            return 2
        case .辰, .巽, .巳, .乾, .亥, .成:
            return 6
        case .寅, .午, .庚, .丁:
            return 9
        case .辛, .酉, .丑, .艮, .丙:
            return 7
        case .unknown:
            return 0
        }
    }

    var cardinalPoint: CardinalPoint {
        switch self {
        case .丙, .午, .丁:
            return .S
        case .未, .坤, .申:
            return .SW
        case .庚, .酉, .辛:
            return .W
        case .成, .乾, .亥:
            return .NW
        case .壬, .子, .癸:
            return .N
        case .丑, .艮, .寅:
            return .NE
        case .甲, .卯, .乙:
            return .E
        case .辰, .巽, .巳:
            return .SE
        case .unknown:
            return .unknown
        }
    }
}
