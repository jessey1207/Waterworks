//
//  GridCombinationsTests.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 19/4/22.
//

import XCTest
import SwiftUI

@testable import Waterworks

class GridCombinationsTests: XCTestCase {
    
    private var sut: GridView.ViewModel!
    
    // MARK: Grid
    private let gridIndices = 0..<9
    private var baseNumbers: [String] = []
    private var locationNumbers: [String] = []
    private var directionNumbers: [String] = []
    private var cardinalCharacters: [String] = []
    private var yearNumbers: [String] = []
    private var isVisibleEvilTexts: [Bool] = []
    private var isVisibleAgeTexts: [Bool] = []
    private var isVisibleStrength: [Bool] = []
    
    func testDefaultGrid() {
        let userInput: GridUserInput = .init()
        userInput.luck = .unknown
        userInput.location = .unknown
        userInput.year = .init(number: 2023)
        
        setupGrid(userInput: userInput)
        XCTAssertEqual(baseNumbers, ["八", "四", "六", "七", "九", "二", "三", "五", "一"])
        XCTAssertEqual(locationNumbers, ["﹖", "﹖", "﹖", "﹖", "﹖", "﹖", "﹖", "﹖", "﹖"])
        XCTAssertEqual(directionNumbers, ["﹖", "﹖", "﹖", "﹖", "﹖", "﹖", "﹖", "﹖", "﹖"])
        XCTAssertEqual(cardinalCharacters, ["巽", "离", "坤", "震", "", "兌", "艮", "坎", "乾"])
        XCTAssertEqual(yearNumbers, ["3", "8", "1", "2", "4", "6", "7", "9", "5"])
        XCTAssertEqual(isVisibleEvilTexts, [false, false, false, false, false, true, false, false, false])
        XCTAssertEqual(isVisibleAgeTexts, [true, false, false, false, false, false, false, false, false])
        XCTAssertEqual(isVisibleStrength, [true, false, false, false, false, false, false, false, false])
    }
    
    func testCombinations() {
        let userInput: GridUserInput = .init()
        
        // Find all combinations
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                // Set up grid
                userInput.luck = luck
                userInput.location = location
                setupGrid(userInput: userInput)
                
                // Assert grid items
                XCTAssertEqual(baseNumbers, Combinations(rawValue: "\(luck)\(location)")!.baseNumbers)
                XCTAssertEqual(locationNumbers, Combinations(rawValue: "\(luck)\(location)")!.locationNumbers)
                XCTAssertEqual(directionNumbers, Combinations(rawValue: "\(luck)\(location)")!.directionNumbers)
                XCTAssertEqual(cardinalCharacters, Combinations(rawValue: "\(luck)\(location)")!.cardinalCharacters)
                
                // Reset
                resetGrid()
            }
        }
    }

    func testRotations() {
        let userInput: GridUserInput = .init()
        
        // Find all combinations
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                // Set up initial grid
                userInput.luck = luck
                userInput.location = location
                setupGrid(userInput: userInput)
                
                // Remember initial numbers
                let initialBaseNumbers = baseNumbers
                let initialLocationNumbers = locationNumbers
                let initialDirectionNumbers = directionNumbers
                let initialCardinalCharacters = cardinalCharacters
                
                // Reset
                resetGrid()
                
                // Set up grid for all rotation possibilities
                CardinalPoint.allCases.filter { $0 != .unknown }.forEach { rotationPoint in
                    setupGrid(userInput: userInput, rotatedPoint: rotationPoint)
                    
                    // Assert rotated grid items
                    XCTAssertEqual(
                        baseNumbers,
                        initialBaseNumbers.rotated(from: userInput.direction.cardinalPoint, to: rotationPoint)
                    )
                    XCTAssertEqual(
                        locationNumbers,
                        initialLocationNumbers.rotated(from: userInput.direction.cardinalPoint, to: rotationPoint)
                    )
                    XCTAssertEqual(
                        directionNumbers,
                        initialDirectionNumbers.rotated(from: userInput.direction.cardinalPoint, to: rotationPoint)
                    )
                    XCTAssertEqual(
                        cardinalCharacters,
                        initialCardinalCharacters.rotated(from: userInput.direction.cardinalPoint, to: rotationPoint)
                    )
                    
                    // Reset
                    resetGrid()
                }
            }
        }
    }

    func testYears() {
        let userInput: GridUserInput = .init()
        
        // For defined (hard-coded) testing years
        Years.allCases.enumerated().forEach { index, year in
            // Set up grid
            userInput.year = .init(number: year.asInteger)
            setupGrid(userInput: userInput)

            // Assert grid items
            XCTAssertEqual(yearNumbers, Years(rawValue: index)!.numbers)
            XCTAssertEqual(isVisibleEvilTexts, Years(rawValue: index)!.isVisibleEvilTexts)
            XCTAssertEqual(isVisibleAgeTexts, Years(rawValue: index)!.isVisibleAgeTexts)
            XCTAssertEqual(isVisibleStrength, Years(rawValue: index)!.isVisibleStrength)
            
            // Reset
            resetGrid()
        }
    }
    
    func testAdded() {
        let userInput: GridUserInput = .init()
        userInput.isAdding = true
        
        // Find all combinations
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                // Set up grid
                userInput.luck = luck
                userInput.location = location
                setupGrid(userInput: userInput)
                
                // Assert location and direction items
                XCTAssertEqual(locationNumbers, Combinations(rawValue: "\(luck)\(location)")!.locationNumbersAdded)
                XCTAssertEqual(directionNumbers, Combinations(rawValue: "\(luck)\(location)")!.directionNumbersAdded)
                
                // Reset
                resetGrid()
            }
        }
    }
    
    // MARK: - Helpers
    
    private func setupGrid(userInput: GridUserInput, rotatedPoint: CardinalPoint? = nil) {
        sut = .init(
            userInput: userInput,
            rotatedPoint: rotatedPoint ?? userInput.direction.cardinalPoint
        )
        gridIndices.forEach { index in
            baseNumbers.append(sut.baseNumber(at: index))
            locationNumbers.append(sut.locationNumber(at: index))
            directionNumbers.append(sut.directionNumber(at: index))
            cardinalCharacters.append(sut.cardinalCharacter(at: index))
            yearNumbers.append(sut.yearNumber(at: index))
            isVisibleEvilTexts.append(sut.isVisibleEvilText(at: index))
            isVisibleAgeTexts.append(sut.isVisibleAgeText(at: index))
            isVisibleStrength.append(sut.isVisibleStrength(at: index))
        }
    }
    
    private func resetGrid() {
        baseNumbers = []
        locationNumbers = []
        directionNumbers = []
        cardinalCharacters = []
        yearNumbers = []
        isVisibleEvilTexts = []
        isVisibleAgeTexts = []
        isVisibleStrength = []
    }
}
