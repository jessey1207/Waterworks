//
//  Year.swift
//  Waterworks
//
//  Created by Jessey Fung on 6/11/2022.
//

import Foundation

struct Year {
    var number: Int

    var gridNumber: Int {
        9 - ((number - 2018) % 9)
    }

    var heavenStem: HeavenStem {
        let allHeavenStems = HeavenStem.allCases
        let index = (number - 2020) % 10
        return allHeavenStems[index]
    }
    
    var earthBranch: EarthBranch {
        let allEarthBranches = EarthBranch.allCases
        let index = (number - 2020) % 12
        return allEarthBranches[index]
    }
}
