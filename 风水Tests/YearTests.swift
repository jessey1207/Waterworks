//
//  YearTests.swift
//  风水Tests
//
//  Created by Jessey Fung on 6/11/2022.
//

import XCTest

@testable import 风水

final class YearTests: XCTestCase {

    let inputs = 2022...2042

    func testGridNumber() {
        let expected: [Int] = [
            5, 4, 3, 2, 1,
            9, 8, 7, 6,
            5, 4, 3, 2, 1,
            9, 8, 7, 6,
            5, 4, 3
            
        ]
        inputs.enumerated().forEach { index, number in
            let gridNumber = Year(number: number).gridNumber
            XCTAssertEqual(gridNumber, expected[index])
        }
    }
    
    func testHeavenStem() {
        let expected: [HeavenStem] = [
            .壬, .癸, .甲,
            .乙, .丙, .丁,
            .戊, .己, .庚,
            .辛, .壬, .癸,
            .甲, .乙, .丙,
            .丁, .戊, .己,
            .庚, .辛, .壬
        ]
        inputs.enumerated().forEach { index, number in
            let heavenStem = Year(number: number).heavenStem
            XCTAssertEqual(heavenStem, expected[index])
        }
    }

    func testEarthBranch() {
        let expected: [EarthBranch] = [
            .寅, .卯, .辰,
            .巳, .午, .未,
            .申, .酉, .戌,
            .亥, .子, .丑,
            .寅, .卯, .辰,
            .巳, .午, .未,
            .申, .酉, .戌
        ]
        inputs.enumerated().forEach { index, number in
            let earthBranch = Year(number: number).earthBranch
            XCTAssertEqual(earthBranch, expected[index])
        }
    }
}
