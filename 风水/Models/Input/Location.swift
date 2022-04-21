//
//  Location.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

// TODO: Refactor
enum Location: String, CaseIterable, Identifiable {
    case 辰, 巽, 巳, 丙, 午, 丁, 未, 坤, 申, 甲, 卯, 乙, 庚, 酉, 辛, 丑, 艮, 寅, 壬, 子, 癸, 成, 乾, 亥
    case unknown = "?"

    var id: Location { self }

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

    var direction: Direction {
        switch self {
        case .丙: return .壬
        case .午: return .子
        case .丁: return .癸
        case .未: return .丑
        case .坤: return .艮
        case .申: return .寅
        case .庚: return .甲
        case .酉: return .卯
        case .辛: return .乙
        case .成: return .辰
        case .乾: return .巽
        case .亥: return .巳
        case .壬: return .丙
        case .子: return .午
        case .癸: return .丁
        case .丑: return .未
        case .艮: return .坤
        case .寅: return .申
        case .甲: return .庚
        case .卯: return .酉
        case .乙: return .辛
        case .辰: return .成
        case .巽: return .乾
        case .巳: return .亥
        case .unknown: return .unknown
        }
    }
}
