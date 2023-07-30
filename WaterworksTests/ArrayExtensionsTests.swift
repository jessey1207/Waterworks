//
//  ArrayExtensionsTests.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 22/7/2023.
//

import XCTest

@testable import Waterworks

final class ArrayExtensionsTests: XCTestCase {
    
    func testRotated() {
        let items = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        
        CardinalPoint.allCases.filter { $0 != .unknown }.forEach { startPoint in
            CardinalPoint.allCases.filter { $0 != .unknown }.forEach { targetPoint in
                guard let test = RotatedTest(rawValue: "\(startPoint.string)\(targetPoint.string)") else {
                    XCTFail("Could not initialise RotatedTest enum.")
                    return
                }
                XCTAssertEqual(
                    items.rotated(from: startPoint, to: targetPoint),
                    test.expectation
                )
            }
        }
    }

    private enum RotatedTest: String {
        case SS, SSE, SE, SNE, SN, SNW, SW, SSW
        case SESE, SEE, SENE, SEN, SENW, SEW, SESW, SES
        case EE, ENE, EN, ENW, EW, ESW, ES, ESE
        case NENE, NEN, NENW, NEW, NESW, NES, NESE, NEE
        case NN, NNW, NW, NSW, NS, NSE, NE, NNE
        case NWNW, NWW, NWSW, NWS, NWSE, NWE, NWNE, NWN
        case WW, WSW, WS, WSE, WE, WNE, WN, WNW
        case SWSW, SWS, SWSE, SWE, SWNE, SWN, SWNW, SWW
        
        static let testArray = [0, 1, 2, 3, 4, 5, 6, 7, 8]
        
        var expectation: [Int] {
            switch self {
            case .SESE, .SS, .SWSW, .EE, .WW, .NENE, .NN, .NWNW:
                return [0, 1, 2, 3, 4, 5, 6, 7, 8]
            case .SES, .SSW, .SWW, .ESE, .WNW, .NEE, .NNE, .NWN:
                return [3, 0, 1, 6, 4, 2, 7, 8, 5]
            case .SESW, .SW, .SWNW, .ES, .WN, .NESE, .NE, .NWNE:
                return [6, 3, 0, 7, 4, 1, 8, 5, 2]
            case .SEE, .SSE, .SWS, .ENE, .WSW, .NEN, .NNW, .NWW:
                return [1, 2, 5, 0, 4, 8, 3, 6, 7]
            case .SEW, .SNW, .SWN, .ESW, .WNE, .NES, .NSE, .NWE:
                return [7, 6, 3, 8, 4, 0, 5, 2, 1]
            case .SENE, .SE, .SWSE, .EN, .WS, .NENW, .NW, .NWSW:
                return [2, 5, 8, 1, 4, 7, 0, 3, 6]
            case .SEN, .SNE, .SWE, .ENW, .WSE, .NEW, .NSW, .NWS:
                return [5, 8, 7, 2, 4, 6, 1, 0, 3]
            case .SENW, .SN, .SWNE, .EW, .WE, .NESW, .NS, .NWSE:
                return [8, 7, 6, 5, 4, 3, 2, 1, 0]
            }
        }
    }
}

private extension CardinalPoint {
    var string: String {
        switch self {
        case .SE: return "SE"
        case .S: return "S"
        case .SW: return "SW"
        case .E: return "E"
        case .W: return "W"
        case .NE: return "NE"
        case .N: return "N"
        case .NW: return "NW"
        case .unknown: return "unknown"
        }
    }
}
