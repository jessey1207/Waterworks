//
//  GridCombinationsTests+Years.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 13/1/2023.
//

import Foundation

extension GridCombinationsTests {
    enum Years: Int, CaseIterable {
        case y2020, y2021, y2022, y2023, y2024, y2025, y2026, y2027, y2028, y2029
        case y2030, y2031, y2032, y2033, y2034, y2035, y2036, y2037, y2038, y2039
        case y2040, y2041, y2042, y2043, y2044, y2045, y2046, y2047, y2048, y2049
        case y2050, y2051, y2052, y2053, y2054, y2055, y2056, y2057, y2058, y2059
        case y2060, y2061, y2062, y2063, y2064, y2065, y2066, y2067, y2068, y2069
        
        var asInteger: Int {
            2020 + self.rawValue
        }
        
        var numbers: [String] {
            switch self {
            case .y2020, .y2029, .y2038, .y2047, .y2056, .y2065:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .y2021, .y2030, .y2039, .y2048, .y2057, .y2066:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .y2022, .y2031, .y2040, .y2049, .y2058, .y2067:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .y2023, .y2032, .y2041, .y2050, .y2059, .y2068:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            case .y2024, .y2033, .y2042, .y2051, .y2060, .y2069:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .y2025, .y2034, .y2043, .y2052, .y2061:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .y2026, .y2035, .y2044, .y2053, .y2062:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .y2027, .y2036, .y2045, .y2054, .y2063:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .y2028, .y2037, .y2046, .y2055, .y2064:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            }
        }
        
        var isVisibleEvilTexts: [Bool] {
            switch self {
            case .y2020, .y2024, .y2028, .y2032, .y2036, .y2040, .y2044, .y2048, .y2052, .y2056, .y2060, .y2064, .y2068:
                return [false, true, false, false, false, false, false, false, false]
            case .y2021, .y2025, .y2029, .y2033, .y2037, .y2041, .y2045, .y2049, .y2053, .y2057, .y2061, .y2065, .y2069:
                return [false, false, false, true, false, false, false, false, false]
            case .y2022, .y2026, .y2030, .y2034, .y2038, .y2042, .y2046, .y2050, .y2054, .y2058, .y2062, .y2066:
                return [false, false, false, false, false, false, false, true, false]
            case .y2023, .y2027, .y2031, .y2035, .y2039, .y2043, .y2047, .y2051, .y2055, .y2059, .y2063, .y2067:
                return [false, false, false, false, false, true, false, false, false]
            }
        }
        var isVisibleAgeTexts: [Bool] {
            switch self {
            case .y2020, .y2022, .y2028, .y2041, .y2042, .y2056, .y2058, .y2064:
                return [false, false, false, false, false, false, true, false, false]
            case .y2021, .y2025, .y2027, .y2035, .y2038, .y2057, .y2061, .y2063:
                return [false, false, false, false, false, true, false, false, false]
            case .y2023, .y2026, .y2045, .y2049, .y2051, .y2059, .y2062:
                return [true, false, false, false, false, false, false, false, false]
            case .y2024, .y2031, .y2060, .y2067:
                return [false, false, false, false, false, false, false, false, true]
            case .y2029, .y2030, .y2044, .y2046, .y2052, .y2065, .y2066:
                return [false, false, false, false, true, false, false, false, false]
            case .y2032, .y2034, .y2040, .y2053, .y2054, .y2068:
                return [false, false, true, false, false, false, false, false, false]
            case .y2033, .y2037, .y2039, .y2047, .y2050, .y2069:
                return [false, false, false, false, false, false, false, true, false]
            case .y2036, .y2043:
                return [false, true, false, false, false, false, false, false, false]
            case .y2048, .y2055:
                return [false, false, false, true, false, false, false, false, false]
            }
        }
    }
}
