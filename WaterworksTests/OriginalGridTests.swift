//
//  OriginalGridTests.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 5/11/2022.
//

import XCTest

@testable import Waterworks

final class OriginalGridTests: XCTestCase {

    private let grid = OriginalGrid()
    
    private let inputs = [0, 1, 2, 3, 4, 6, 7, 8, 9]

    func testGetLocation() {
        let expected: [(Location, Location, Location)] = [
            (.unknown, .unknown, .unknown),
            (.壬, .子, .癸),
            (.未, .坤, .申),
            (.甲, .卯, .乙),
            (.辰, .巽, .巳),
            (.unknown, .unknown, .unknown),
            (.戌, .乾, .亥),
            (.庚, .酉, .辛),
            (.丑, .艮, .寅),
            (.丙, .午, .丁)
            
        ]
        inputs.forEach { number in
            XCTAssertEqual(grid.getLocation(from: number, at: 0), expected[number].0)
            XCTAssertEqual(grid.getLocation(from: number, at: 1), expected[number].1)
            XCTAssertEqual(grid.getLocation(from: number, at: 2), expected[number].2)
        }
    }

    func testGetDirection() {
        let expected: [(Direction, Direction, Direction)] = [
            (.unknown, .unknown, .unknown),
            (.壬, .子, .癸),
            (.未, .坤, .申),
            (.甲, .卯, .乙),
            (.辰, .巽, .巳),
            (.unknown, .unknown, .unknown),
            (.戌, .乾, .亥),
            (.庚, .酉, .辛),
            (.丑, .艮, .寅),
            (.丙, .午, .丁)
            
        ]
        inputs.forEach { number in
            XCTAssertEqual(grid.getDirection(from: number, at: 0), expected[number].0)
            XCTAssertEqual(grid.getDirection(from: number, at: 1), expected[number].1)
            XCTAssertEqual(grid.getDirection(from: number, at: 2), expected[number].2)
        }
    }
}
