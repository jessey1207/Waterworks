//
//  Strength.swift
//  Waterworks
//
//  Created by Jessey Fung on 3/2/2023.
//

import Foundation

enum Strength {
    case 寅
    case 巳
    case 申
    case 亥
    
    var cardinalPoint: CardinalPoint {
        switch self {
        case .寅: return .NE
        case .巳: return .SE
        case .申: return .SW
        case .亥: return .NW
        }
    }
}
