//
//  GridFormulaTests.swift
//  风水Tests
//
//  Created by Jessey Fung on 5/11/2022.
//

import XCTest

@testable import 风水

final class GridFormulaTests: XCTestCase {

    private let inputs = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    func testGenerateGridItemsClockwise() {
        let expected: [[Int]] = [
            [8, 4, 6, 7, 9, 2, 3, 5, 1],
            [9, 5, 7, 8, 1, 3, 4, 6, 2],
            [1, 6, 8, 9, 2, 4, 5, 7, 3],
            [2, 7, 9, 1, 3, 5, 6, 8, 4],
            [3, 8, 1, 2, 4, 6, 7, 9, 5],
            [4, 9, 2, 3, 5, 7, 8, 1, 6],
            [5, 1, 3, 4, 6, 8, 9, 2, 7],
            [6, 2, 4, 5, 7, 9, 1, 3, 8],
            [7, 3, 5, 6, 8, 1, 2, 4, 9],
            [8, 4, 6, 7, 9, 2, 3, 5, 1]
        ]
        inputs.forEach { number in
            let items = GridFormula.clockwise.generateGridItems(center: number).map { $0.number }
            XCTAssertEqual(items, expected[number])
        }
    }

    func testGenerateGridItemsAnticlockwise() {
        let expected: [[Int]] = [
            [1, 5, 3, 2, 9, 7, 6, 4, 8],
            [2, 6, 4, 3, 1, 8, 7, 5, 9],
            [3, 7, 5, 4, 2, 9, 8, 6, 1],
            [4, 8, 6, 5, 3, 1, 9, 7, 2],
            [5, 9, 7, 6, 4, 2, 1, 8, 3],
            [6, 1, 8, 7, 5, 3, 2, 9, 4],
            [7, 2, 9, 8, 6, 4, 3, 1, 5],
            [8, 3, 1, 9, 7, 5, 4, 2, 6],
            [9, 4, 2, 1, 8, 6, 5, 3, 7],
            [1, 5, 3, 2, 9, 7, 6, 4, 8]
        ]
        inputs.forEach { number in
            let items = GridFormula.anticlockwise.generateGridItems(center: number).map { $0.number }
            XCTAssertEqual(items, expected[number])
        }
    }
}
