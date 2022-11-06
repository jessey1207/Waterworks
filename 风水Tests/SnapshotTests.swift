//
//  __Tests.swift
//  风水Tests
//
//  Created by Jessey Fung on 19/4/22.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import 风水

/// Snapshot tests are run on iPhone 14

class SnapshotTests: XCTestCase {
    
    let userInput = UserInput()
    
    func testDirectionPickerGrid() {
        let view = ContentView(selectedTab: .directionPickerGrid)
        assertSnapshot(matching: view, as: .image, named: "default")
    }

    func testYearPickerGrid() {
        let view = ContentView(selectedTab: .yearPickerGrid)
        assertSnapshot(matching: view, as: .image, named: "default")
    }
    
    
    func testCombinations() {
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                userInput.luck = luck
                userInput.location = location

                let view = ContentView(userInput: userInput, selectedTab: .directionPickerGrid)
                assertSnapshot(
                    matching: view,
                    as: .image,
                    named: [
                        String(luck.rawValue),
                        Constants.ChinesePicker.luckText,
                        location.rawValue,
                        Constants.ChinesePicker.locationText
                    ].joined(separator: "-")
                )
            }
        }
    }

    func testRotations() {
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                userInput.luck = luck
                userInput.location = location
    
                let view = ContentView(userInput: userInput, selectedTab: .directionPickerGrid)
                assertSnapshot(
                    matching: view,
                    as: .image,
                    named: [
                        String(luck.rawValue),
                        Constants.ChinesePicker.luckText,
                        location.rawValue,
                        Constants.ChinesePicker.locationText,
                        "rotated"
                    ].joined(separator: "-")
                )
            }
        }
    }

    func testYears() {
        (2022 ... 2072).forEach { year in
            userInput.year = .init(number: year)

            let view = ContentView(
                userInput: userInput,
                selectedTab: .yearPickerGrid
            )
            assertSnapshot(
                matching: view,
                as: .image,
                named: String(year)
            )
        }
    }
}


