//
//  Types.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import Foundation

enum CalculationType: String, CaseIterable, Identifiable {
    case first = "第一"
    case second = "第二"

    var id: CalculationType { self }
}
