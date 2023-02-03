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
        setupGrid(userInput: .init())
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
        let userInput: UserInput = .init()
        
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
        let userInput: UserInput = .init()
        
        // Find all combinations
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                // Set up grid
                userInput.luck = luck
                userInput.location = location
                setupGrid(userInput: userInput, rotated: true)
                
                // Assert grid items
                XCTAssertEqual(baseNumbers, Combinations(rawValue: "\(luck)\(location)")!.baseNumbersRotated)
                XCTAssertEqual(locationNumbers, Combinations(rawValue: "\(luck)\(location)")!.locationNumbersRotated)
                XCTAssertEqual(directionNumbers, Combinations(rawValue: "\(luck)\(location)")!.directionNumbersRotated)
                XCTAssertEqual(cardinalCharacters, Combinations(rawValue: "\(luck)\(location)")!.cardinalCharactersRotated)
                
                // Reset
                resetGrid()
            }
        }
    }

    func testYears() {
        let userInput: UserInput = .init()
        
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
    
    // MARK: Helpers
    
    private func setupGrid(userInput: UserInput, rotated: Bool = false) {
        sut = .init(userInput: userInput, rotated: rotated)
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
