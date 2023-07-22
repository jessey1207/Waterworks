//
//  GridCombinationsTests+Combinations.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 13/1/2023.
//

import Foundation

extension GridCombinationsTests {
    enum Combinations: String {
        case one辰, one巽, one巳, one丙, one午, one丁, one未, one坤, one申, one甲, one卯, one乙, one庚, one酉, one辛, one丑, one艮, one寅, one壬, one子, one癸, one戌, one乾, one亥
        case two辰, two巽, two巳, two丙, two午, two丁, two未, two坤, two申, two甲, two卯, two乙, two庚, two酉, two辛, two丑, two艮, two寅, two壬, two子, two癸, two戌, two乾, two亥
        case three辰, three巽, three巳, three丙, three午, three丁, three未, three坤, three申, three甲, three卯, three乙, three庚, three酉, three辛, three丑, three艮, three寅, three壬, three子, three癸, three戌, three乾, three亥
        case four辰, four巽, four巳, four丙, four午, four丁, four未, four坤, four申, four甲, four卯, four乙, four庚, four酉, four辛, four丑, four艮, four寅, four壬, four子, four癸, four戌, four乾, four亥
        case five辰, five巽, five巳, five丙, five午, five丁, five未, five坤, five申, five甲, five卯, five乙, five庚, five酉, five辛, five丑, five艮, five寅, five壬, five子, five癸, five戌, five乾, five亥
        case six辰, six巽, six巳, six丙, six午, six丁, six未, six坤, six申, six甲, six卯, six乙, six庚, six酉, six辛, six丑, six艮, six寅, six壬, six子, six癸, six戌, six乾, six亥
        case seven辰, seven巽, seven巳, seven丙, seven午, seven丁, seven未, seven坤, seven申, seven甲, seven卯, seven乙, seven庚, seven酉, seven辛, seven丑, seven艮, seven寅, seven壬, seven子, seven癸, seven戌, seven乾, seven亥
        case eight辰, eight巽, eight巳, eight丙, eight午, eight丁, eight未, eight坤, eight申, eight甲, eight卯, eight乙, eight庚, eight酉, eight辛, eight丑, eight艮, eight寅, eight壬, eight子, eight癸, eight戌, eight乾, eight亥
        case nine辰, nine巽, nine巳, nine丙, nine午, nine丁, nine未, nine坤, nine申, nine甲, nine卯, nine乙, nine庚, nine酉, nine辛, nine丑, nine艮, nine寅, nine壬, nine子, nine癸, nine戌, nine乾, nine亥
        
        // MARK: - Base numbers
        
        var baseNumbers: [String] {
            switch self {
            case .one辰, .one巽, .one巳, .one丙, .one午, .one丁, .one未, .one坤, .one申, .one甲, .one卯, .one乙, .one庚, .one酉, .one辛, .one丑, .one艮, .one寅, .one壬, .one子, .one癸, .one戌, .one乾, .one亥:
                return ["九", "五", "七", "八", "一", "三", "四", "六", "二"]
            case .two辰, .two巽, .two巳, .two丙, .two午, .two丁, .two未, .two坤, .two申, .two甲, .two卯, .two乙, .two庚, .two酉, .two辛, .two丑, .two艮, .two寅, .two壬, .two子, .two癸, .two戌, .two乾, .two亥:
                return ["一", "六", "八", "九", "二", "四", "五", "七", "三"]
            case .three辰, .three巽, .three巳, .three丙, .three午, .three丁, .three未, .three坤, .three申, .three甲, .three卯, .three乙, .three庚, .three酉, .three辛, .three丑, .three艮, .three寅, .three壬, .three子, .three癸, .three戌, .three乾, .three亥:
                return ["二", "七", "九", "一", "三", "五", "六", "八", "四"]
            case .four辰, .four巽, .four巳, .four丙, .four午, .four丁, .four未, .four坤, .four申, .four甲, .four卯, .four乙, .four庚, .four酉, .four辛, .four丑, .four艮, .four寅, .four壬, .four子, .four癸, .four戌, .four乾, .four亥:
                return ["三", "八", "一", "二", "四", "六", "七", "九", "五"]
            case .five辰, .five巽, .five巳, .five丙, .five午, .five丁, .five未, .five坤, .five申, .five甲, .five卯, .five乙, .five庚, .five酉, .five辛, .five丑, .five艮, .five寅, .five壬, .five子, .five癸, .five戌, .five乾, .five亥:
                return ["四", "九", "二", "三", "五", "七", "八", "一", "六"]
            case .six辰, .six巽, .six巳, .six丙, .six午, .six丁, .six未, .six坤, .six申, .six甲, .six卯, .six乙, .six庚, .six酉, .six辛, .six丑, .six艮, .six寅, .six壬, .six子, .six癸, .six戌, .six乾, .six亥:
                return ["五", "一", "三", "四", "六", "八", "九", "二", "七"]
            case .seven辰, .seven巽, .seven巳, .seven丙, .seven午, .seven丁, .seven未, .seven坤, .seven申, .seven甲, .seven卯, .seven乙, .seven庚, .seven酉, .seven辛, .seven丑, .seven艮, .seven寅, .seven壬, .seven子, .seven癸, .seven戌, .seven乾, .seven亥:
                return ["六", "二", "四", "五", "七", "九", "一", "三", "八"]
            case .eight辰, .eight巽, .eight巳, .eight丙, .eight午, .eight丁, .eight未, .eight坤, .eight申, .eight甲, .eight卯, .eight乙, .eight庚, .eight酉, .eight辛, .eight丑, .eight艮, .eight寅, .eight壬, .eight子, .eight癸, .eight戌, .eight乾, .eight亥:
                return ["七", "三", "五", "六", "八", "一", "二", "四", "九"]
            case .nine辰, .nine巽, .nine巳, .nine丙, .nine午, .nine丁, .nine未, .nine坤, .nine申, .nine甲, .nine卯, .nine乙, .nine庚, .nine酉, .nine辛, .nine丑, .nine艮, .nine寅, .nine壬, .nine子, .nine癸, .nine戌, .nine乾, .nine亥:
                return ["八", "四", "六", "七", "九", "二", "三", "五", "一"]
            }
        }
        
        // MARK: - Location numbers
        
        var locationNumbers: [String] {
            switch self {
            case .one辰, .two甲, .three未, .four壬, .five丙, .six丑, .seven庚, .eight戌:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .one巽, .one巳, .two卯, .two乙, .three坤, .three申, .four子, .four癸, .five午, .five丁, .six艮, .six寅, .seven酉, .seven辛, .eight乾, .eight亥:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .one丙, .two艮, .two寅, .three庚, .four乾, .four亥, .six巽, .six巳, .seven甲, .eight坤, .eight申, .nine壬:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one午, .one丁, .two丑, .three酉, .three辛, .four戌, .six辰, .seven卯, .seven乙, .eight未, .nine子, .nine癸:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one未, .two壬, .three丙, .four丑, .five庚, .six戌, .eight辰, .nine甲:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .one坤, .one申, .two子, .two癸, .three午, .three丁, .four艮, .four寅, .five酉, .five辛, .six乾, .six亥, .eight巽, .eight巳, .nine卯, .nine乙:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .one甲, .two未, .three壬, .four丙, .five丑, .six庚, .seven戌, .nine辰:
                return ["9", "4", "2", "1", "8", "6", "5", "3", "7"]
            case .one卯, .one乙, .two坤, .two申, .three子, .three癸, .four午, .four丁, .five艮, .five寅, .six酉, .six辛, .seven乾, .seven亥, .nine巽, .nine巳:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            case .one庚, .two戌, .four辰, .five甲, .six未, .seven壬, .eight丙, .nine丑:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .one酉, .one辛, .two乾, .two亥, .four巽, .four巳, .five卯, .five乙, .six坤, .six申, .seven子, .seven癸, .eight午, .eight丁, .nine艮, .nine寅:
                return ["4", "8", "6", "5", "3", "1", "9", "7", "2"]
            case .one丑, .two庚, .three戌, .five辰, .six甲, .seven未, .eight壬, .nine丙:
                return ["5", "9", "7", "6", "4", "2", "1", "8", "3"]
            case .one艮, .one寅, .two酉, .two辛, .three乾, .three亥, .five巽, .five巳, .six卯, .six乙, .seven坤, .seven申, .eight子, .eight癸, .nine午, .nine丁:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            case .one壬, .two丙, .three丑, .four庚, .five戌, .seven辰, .eight甲, .nine未:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one子, .one癸, .two午, .two丁, .three艮, .three寅, .four酉, .four辛, .five乾, .five亥, .seven巽, .seven巳, .eight卯, .eight乙, .nine坤, .nine申:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one戌, .three辰, .four甲, .five未, .six壬, .seven丙, .eight丑, .nine庚:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .one乾, .one亥, .three巽, .three巳, .four卯, .four乙, .five坤, .five申, .six子, .six癸, .seven午, .seven丁, .eight艮, .eight寅, .nine酉, .nine辛:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .two辰, .three甲, .four未, .five壬, .six丙, .seven丑, .eight庚, .nine戌:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .two巽, .two巳, .three卯, .three乙, .four坤, .four申, .five子, .five癸, .six午, .six丁, .seven艮, .seven寅, .eight酉, .eight辛, .nine乾, .nine亥:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            }
        }
        
        var locationNumbersAdded: [String] {
            switch self {
            case .one辰, .one卯, .two坤, .two甲, .three未, .three子, .four午, .four壬, .five丙, .five艮, .six酉, .six丑, .seven庚, .seven乾, .eight戌, .nine巽:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .one巽, .one巳, .two卯, .two乙, .three坤, .three申, .four子, .four癸, .five午, .five丁, .six艮, .six寅, .seven酉, .seven辛, .eight乾, .eight亥:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .one丙, .two艮, .two寅, .three庚, .four乾, .four亥, .six巽, .six巳, .seven甲, .eight坤, .eight申, .nine壬:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one午, .one丁, .two丑, .three酉, .three辛, .four戌, .six辰, .seven卯, .seven乙, .eight未, .nine子, .nine癸:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one未, .one乙, .two申, .two壬, .three丙, .three癸, .four丁, .four丑, .five庚, .five寅, .six辛, .six戌, .seven亥, .eight辰, .nine巳, .nine甲:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .one坤, .one申, .one甲, .two未, .two子, .two癸, .three午, .three丁, .three壬, .four丙, .four艮, .four寅, .five酉, .five辛, .five丑, .six庚, .six乾, .six亥, .seven戌, .eight巽, .eight巳, .nine辰, .nine卯, .nine乙:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .one庚, .one亥, .two戌, .three巳, .four辰, .four乙, .five申, .five甲, .six未, .six癸, .seven丁, .seven壬, .eight丙, .eight寅, .nine辛, .nine丑:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .one酉, .one辛, .one戌, .two乾, .two亥, .three辰, .four巽, .four巳, .four甲, .five未, .five卯, .five乙, .six坤, .six申, .six壬, .seven丙, .seven子, .seven癸, .eight午, .eight丁, .eight丑, .nine庚, .nine艮, .nine寅:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .one丑, .one壬, .two丙, .two庚, .three丑, .three戌, .four庚, .five辰, .five戌, .six甲, .seven辰, .seven未, .eight甲, .eight壬, .nine丙, .nine未:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one艮, .one寅, .one子, .one癸, .two午, .two丁, .two酉, .two辛, .three艮, .three寅, .three乾, .three亥, .four酉, .four辛, .five巽, .five巳, .five乾, .five亥, .six卯, .six乙, .seven巽, .seven巳, .seven坤, .seven申, .eight卯, .eight乙, .eight子, .eight癸, .nine午, .nine丁, .nine坤, .nine申:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one乾, .two辰, .three巽, .three甲, .four未, .four卯, .five坤, .five壬, .six丙, .six子, .seven午, .seven丑, .eight庚, .eight艮, .nine酉, .nine戌:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .two巽, .two巳, .three卯, .three乙, .four坤, .four申, .five子, .five癸, .six午, .six丁, .seven艮, .seven寅, .eight酉, .eight辛, .nine乾, .nine亥:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            }
        }
        
        // MARK: - Direction numbers
        
        var directionNumbers: [String] {
            switch self {
            case .one辰, .three戌, .four庚, .five丑, .six丙, .seven壬, .eight未, .nine甲:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .one巽, .one巳, .three乾, .three亥, .four酉, .four辛, .five艮, .five寅, .six午, .six丁, .seven子, .seven癸, .eight坤, .eight申, .nine卯, .nine乙:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .one丙, .two壬, .three未, .four甲, .five辰, .seven戌, .eight庚, .nine丑:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one午, .one丁, .two子, .two癸, .three坤, .three申, .four卯, .four乙, .five巽, .five巳, .seven乾, .seven亥, .eight酉, .eight辛, .nine艮, .nine寅:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one未, .two甲, .three辰, .five戌, .six庚, .seven丑, .eight丙, .nine壬:
                return ["5", "9", "7", "6", "4", "2", "1", "8", "3"]
            case .one坤, .one申, .two卯, .two乙, .three巽, .three巳, .five乾, .five亥, .six酉, .six辛, .seven艮, .seven寅, .eight午, .eight丁, .nine子, .nine癸:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            case .one甲, .two辰, .four戌, .five庚, .six丑, .seven丙, .eight壬, .nine未:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .one卯, .one乙, .two巽, .two巳, .four乾, .four亥, .five酉, .five辛, .six艮, .six寅, .seven午, .seven丁, .eight子, .eight癸, .nine坤, .nine申:
                return ["4", "8", "6", "5", "3", "1", "9", "7", "2"]
            case .one庚, .two丑, .three丙, .four壬, .five未, .six甲, .seven辰, .nine戌:
                return ["9", "4", "2", "1", "8", "6", "5", "3", "7"]
            case .one酉, .one辛, .two艮, .two寅, .three午, .three丁, .four子, .four癸, .five坤, .five申, .six卯, .six乙, .seven巽, .seven巳, .nine乾, .nine亥:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            case .one丑, .two丙, .three壬, .four未, .five甲, .six辰, .eight戌, .nine庚:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .one艮, .one寅, .two午, .two丁, .three子, .three癸, .four坤, .four申, .five卯, .five乙, .six巽, .six巳, .eight乾, .eight亥, .nine酉, .nine辛:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .one壬, .two坤, .two申, .three甲, .four巽, .four巳, .six乾, .six亥, .seven庚, .eight艮, .eight寅, .nine丙:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one子, .one癸, .two未, .three卯, .three乙, .four辰, .six戌, .seven酉, .seven辛, .eight丑, .nine午, .nine丁:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one戌, .two庚, .three丑, .four丙, .five壬, .six未, .seven甲, .eight辰:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .one乾, .one亥, .two酉, .two辛, .three艮, .three寅, .four午, .four丁, .five子, .five癸, .six坤, .six申, .seven卯, .seven乙, .eight巽, .eight巳:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .two戌, .three庚, .four丑, .five丙, .six壬, .seven未, .eight甲, .nine辰:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .two乾, .two亥, .three酉, .three辛, .four艮, .four寅, .five午, .five丁, .six子, .six癸, .seven坤, .seven申, .eight卯, .eight乙, .nine巽, .nine巳:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            }
        }
        
        var directionNumbersAdded: [String] {
            switch self {
            case .one辰, .one卯, .one乙, .two巽, .two巳, .three戌, .four庚, .four乾, .four亥, .five酉, .five辛, .five丑, .six丙, .six艮, .six寅, .seven午, .seven丁, .seven壬, .eight未, .eight子, .eight癸, .nine坤, .nine申, .nine甲:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .one巽, .two戌, .three庚, .three乾, .four酉, .four丑, .five丙, .five艮, .six午, .six壬, .seven未, .seven子, .eight坤, .eight甲, .nine辰, .nine卯:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .one巳, .one甲, .two辰, .three亥, .four辛, .four戌, .five庚, .five寅, .six丁, .six丑, .seven丙, .seven癸, .eight申, .eight壬, .nine未, .nine乙:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .one丙, .one未, .two甲, .two壬, .three辰, .three未, .four甲, .five辰, .five戌, .six庚, .seven丑, .seven戌, .eight丙, .eight庚, .nine丑, .nine壬:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one午, .one丁, .one坤, .one申, .two卯, .two乙, .two子, .two癸, .three巽, .three巳, .three坤, .three申, .four卯, .four乙, .five巽, .five巳, .five乾, .five亥, .six酉, .six辛, .seven艮, .seven寅, .seven乾, .seven亥, .eight午, .eight丁, .eight酉, .eight辛, .nine艮, .nine寅, .nine子, .nine癸:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one庚, .one艮, .one寅, .two午, .two丁, .two丑, .three丙, .three子, .three癸, .four坤, .four申, .four壬, .five未, .five卯, .five乙, .six巽, .six巳, .six甲, .seven辰, .eight乾, .eight亥, .nine酉, .nine辛, .nine戌:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .one酉, .one戌, .two庚, .two艮, .three午, .three丑, .four丙, .four子, .five坤, .five壬, .six未, .six卯, .seven巽, .seven甲, .eight辰, .nine乾:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .one辛, .one丑, .two丙, .two寅, .three丁, .three壬, .four未, .four癸, .five申, .five甲, .six辰, .six乙, .seven巳, .eight戌, .nine庚, .nine亥:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .one子, .one癸, .two未, .three卯, .three乙, .four辰, .six戌, .seven酉, .seven辛, .eight丑, .nine午, .nine丁:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
                
            case .one壬, .two坤, .two申, .three甲, .four巽, .four巳, .six乾, .six亥, .seven庚, .eight艮, .eight寅, .nine丙:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one乾, .one亥, .two酉, .two辛, .three艮, .three寅, .four午, .four丁, .five子, .five癸, .six坤, .six申, .seven卯, .seven乙, .eight巽, .eight巳:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .two乾, .two亥, .three酉, .three辛, .four艮, .four寅, .five午, .five丁, .six子, .six癸, .seven坤, .seven申, .eight卯, .eight乙, .nine巽, .nine巳:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            }
        }
        
        // MARK: - Cardinal characters
        
        var cardinalCharacters: [String] {
            ["巽", "离", "坤", "震", "", "兌", "艮", "坎", "乾"]
        }
    }
}
