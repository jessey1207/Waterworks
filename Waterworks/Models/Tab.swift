//
//  Tab.swift
//  Waterworks
//
//  Created by Jessey Fung on 6/11/2022.
//

import Foundation

enum Tab {
    case directionPickerGrid
    case yearPickerGrid

    var tabTitle: String {
        switch self {
        case .directionPickerGrid:
            return Constants.Tab.directionPickerGrid
        case .yearPickerGrid:
            return Constants.Tab.yearPickerGrid
        }
    }
}
