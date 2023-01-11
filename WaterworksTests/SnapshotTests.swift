//
//  __Tests.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 19/4/22.
//

import XCTest
import SnapshotTesting
import SwiftUI

@testable import Waterworks

/// Snapshot tests are run on iPhone 14

// TODO: Change these into algorithm tests. Snapshots will keep changing

class SnapshotTests: XCTestCase {
    
    let userInput = UserInput()
    
    func testGrid() {
        let view = ContentView().frame(width: 400, height: 800)
        assertSnapshot(matching: view, as: .image, named: "default")
    }
    
    func testCombinations() {
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                userInput.luck = luck
                userInput.location = location

                let view = ContentView(userInput: userInput)
                    .frame(width: 400, height: 800)
                
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
                
                let view = ContentView(userInput: userInput)
                    .frame(width: 400, height: 800)
                
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
            userInput.year = .init(number: Int(year))
            
            let view = ContentView(userInput: userInput)
                .frame(width: 400, height: 800)
            
            assertSnapshot(
                matching: view,
                as: .image,
                named: String(year)
            )
        }
    }
}


