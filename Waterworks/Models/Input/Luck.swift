//
//  Luck.swift
//  Waterworks
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

enum Luck: Int, CaseIterable, Identifiable {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    case six = 6
    case seven = 7
    case eight = 8
    case nine = 9
    case unknown = 0

    var id: Luck { self }
}
