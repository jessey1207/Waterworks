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

class SnapshotTests: XCTestCase {
    
    let userInput = UserInput()
    
    func testDefaultAppearance() {
        let view = ContentView()
        assertSnapshot(matching: view.snapshot(), as: .image)
    }
    
    func testCombinations() {
        Luck.allCases.filter({ $0 != .unknown }).forEach { luck in
            Location.allCases.filter({ $0 != .unknown }).forEach { location in
                userInput.luck = luck
                userInput.location = location
                let view = ContentView(userInput: userInput, hideShareButton: false)

                assertSnapshot(
                    matching: view.snapshot(),
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
}
