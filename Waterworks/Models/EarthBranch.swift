//
//  EarthBranch.swift
//  Waterworks
//
//  Created by Jessey Fung on 5/11/2022.
//

import Foundation

enum EarthBranch: String, CaseIterable {
    case 子, 丑, 寅, 卯, 辰, 巳, 午, 未, 申, 酉, 戌, 亥

    var number: Int {
        switch self {
        case .子:
            return 1
        case .未, .申:
            return 2
        case .卯:
            return 3
        case .辰, .巳:
            return 4
        case .亥, .戌:
            return 6
        case .酉:
            return 7
        case .寅, .丑:
            return 8
        case .午:
            return 9
        }
    }

    var cardinalPoint: CardinalPoint {
        switch self {
        case .申, .子, .辰:
            return .S
        case .亥, .卯, .未:
            return .W
        case .寅, .午, .戌:
            return .N
        case .巳, .酉, .丑:
            return .E
        }
    }
    
    var strength: Strength {
        switch self {
        case .亥, .子, .丑:
            return .寅
        case .寅, .卯, .辰:
            return .巳
        case .巳, .午, .未:
            return .申
        case .申, .酉, .戌:
            return .亥
        }
    }
}
