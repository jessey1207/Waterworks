//
//  CompassViewModelTests.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 30/7/2023.
//

import XCTest

@testable import Waterworks

final class CompassViewModelTests: XCTestCase {
    private var sut: CompassView.ViewModel!

    override func setUp() {
        super.setUp()
    }
    
    func testInitializer() {
        let userInput: GridUserInput = .init()
        
        // Find all user input combinations
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                // Set up
                userInput.luck = luck
                userInput.location = location
                sut = .init(userInput: userInput, rotatedPoint: userInput.direction.cardinalPoint)
                
                // Initial compass points should always be the original
                XCTAssertEqual(sut.topPoint, .S)
                XCTAssertEqual(sut.topLeftPoint, .SE)
                XCTAssertEqual(sut.leftPoint, .E)
                XCTAssertEqual(sut.bottomLeftPoint, .NE)
                XCTAssertEqual(sut.bottomPoint, .N)
                XCTAssertEqual(sut.bottomRightPoint, .NW)
                XCTAssertEqual(sut.rightPoint, .W)
                XCTAssertEqual(sut.topRightPoint, .SW)
            }
        }
    }
    
    func testRotations() {
        let userInput: GridUserInput = .init()
        
        // Find all user input combinations
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                // Set up
                userInput.luck = luck
                userInput.location = location
                
                // Test all rotations
                CardinalPoint.allCases.filter { $0 != .unknown }.forEach { rotatedPoint in
                    sut = .init(userInput: userInput, rotatedPoint: rotatedPoint)
                    var compassLabels = [
                        sut.topPoint,
                        sut.topLeftPoint,
                        sut.leftPoint,
                        sut.bottomLeftPoint,
                        sut.bottomPoint,
                        sut.bottomRightPoint,
                        sut.rightPoint,
                        sut.topRightPoint
                    ]
                    let southOffset = compassLabels.firstIndex(of: .S)!
                    
                    // When compass array is offsetted, it should always be in the expected order (anti-clockwise).
                    var offsettedArray: [CardinalPoint] = []
                    for index in 0..<8 {
                        offsettedArray.append(compassLabels[(southOffset + index) % 8])
                    }
                    XCTAssertEqual(offsettedArray, [.S, .SE, .E, .NE, .N, .NW, .W, .SW])
                }
            }
        }
    }
}
