//
//  GridCombinationsTests+Combinations.swift
//  WaterworksTests
//
//  Created by Jessey Fung on 13/1/2023.
//

import Foundation

extension GridCombinationsTests {
    enum Combinations: String {
        case one辰, one巽, one巳, one丙, one午, one丁, one未, one坤, one申, one甲, one卯, one乙, one庚, one酉, one辛, one丑, one艮, one寅, one壬, one子, one癸, one成, one乾, one亥
        case two辰, two巽, two巳, two丙, two午, two丁, two未, two坤, two申, two甲, two卯, two乙, two庚, two酉, two辛, two丑, two艮, two寅, two壬, two子, two癸, two成, two乾, two亥
        case three辰, three巽, three巳, three丙, three午, three丁, three未, three坤, three申, three甲, three卯, three乙, three庚, three酉, three辛, three丑, three艮, three寅, three壬, three子, three癸, three成, three乾, three亥
        case four辰, four巽, four巳, four丙, four午, four丁, four未, four坤, four申, four甲, four卯, four乙, four庚, four酉, four辛, four丑, four艮, four寅, four壬, four子, four癸, four成, four乾, four亥
        case five辰, five巽, five巳, five丙, five午, five丁, five未, five坤, five申, five甲, five卯, five乙, five庚, five酉, five辛, five丑, five艮, five寅, five壬, five子, five癸, five成, five乾, five亥
        case six辰, six巽, six巳, six丙, six午, six丁, six未, six坤, six申, six甲, six卯, six乙, six庚, six酉, six辛, six丑, six艮, six寅, six壬, six子, six癸, six成, six乾, six亥
        case seven辰, seven巽, seven巳, seven丙, seven午, seven丁, seven未, seven坤, seven申, seven甲, seven卯, seven乙, seven庚, seven酉, seven辛, seven丑, seven艮, seven寅, seven壬, seven子, seven癸, seven成, seven乾, seven亥
        case eight辰, eight巽, eight巳, eight丙, eight午, eight丁, eight未, eight坤, eight申, eight甲, eight卯, eight乙, eight庚, eight酉, eight辛, eight丑, eight艮, eight寅, eight壬, eight子, eight癸, eight成, eight乾, eight亥
        case nine辰, nine巽, nine巳, nine丙, nine午, nine丁, nine未, nine坤, nine申, nine甲, nine卯, nine乙, nine庚, nine酉, nine辛, nine丑, nine艮, nine寅, nine壬, nine子, nine癸, nine成, nine乾, nine亥
        
        // MARK: - Base numbers
        
        var baseNumbers: [String] {
            switch self {
            case .one辰, .one巽, .one巳, .one丙, .one午, .one丁, .one未, .one坤, .one申, .one甲, .one卯, .one乙, .one庚, .one酉, .one辛, .one丑, .one艮, .one寅, .one壬, .one子, .one癸, .one成, .one乾, .one亥:
                return ["九", "五", "七", "八", "一", "三", "四", "六", "二"]
            case .two辰, .two巽, .two巳, .two丙, .two午, .two丁, .two未, .two坤, .two申, .two甲, .two卯, .two乙, .two庚, .two酉, .two辛, .two丑, .two艮, .two寅, .two壬, .two子, .two癸, .two成, .two乾, .two亥:
                return ["一", "六", "八", "九", "二", "四", "五", "七", "三"]
            case .three辰, .three巽, .three巳, .three丙, .three午, .three丁, .three未, .three坤, .three申, .three甲, .three卯, .three乙, .three庚, .three酉, .three辛, .three丑, .three艮, .three寅, .three壬, .three子, .three癸, .three成, .three乾, .three亥:
                return ["二", "七", "九", "一", "三", "五", "六", "八", "四"]
            case .four辰, .four巽, .four巳, .four丙, .four午, .four丁, .four未, .four坤, .four申, .four甲, .four卯, .four乙, .four庚, .four酉, .four辛, .four丑, .four艮, .four寅, .four壬, .four子, .four癸, .four成, .four乾, .four亥:
                return ["三", "八", "一", "二", "四", "六", "七", "九", "五"]
            case .five辰, .five巽, .five巳, .five丙, .five午, .five丁, .five未, .five坤, .five申, .five甲, .five卯, .five乙, .five庚, .five酉, .five辛, .five丑, .five艮, .five寅, .five壬, .five子, .five癸, .five成, .five乾, .five亥:
                return ["四", "九", "二", "三", "五", "七", "八", "一", "六"]
            case .six辰, .six巽, .six巳, .six丙, .six午, .six丁, .six未, .six坤, .six申, .six甲, .six卯, .six乙, .six庚, .six酉, .six辛, .six丑, .six艮, .six寅, .six壬, .six子, .six癸, .six成, .six乾, .six亥:
                return ["五", "一", "三", "四", "六", "八", "九", "二", "七"]
            case .seven辰, .seven巽, .seven巳, .seven丙, .seven午, .seven丁, .seven未, .seven坤, .seven申, .seven甲, .seven卯, .seven乙, .seven庚, .seven酉, .seven辛, .seven丑, .seven艮, .seven寅, .seven壬, .seven子, .seven癸, .seven成, .seven乾, .seven亥:
                return ["六", "二", "四", "五", "七", "九", "一", "三", "八"]
            case .eight辰, .eight巽, .eight巳, .eight丙, .eight午, .eight丁, .eight未, .eight坤, .eight申, .eight甲, .eight卯, .eight乙, .eight庚, .eight酉, .eight辛, .eight丑, .eight艮, .eight寅, .eight壬, .eight子, .eight癸, .eight成, .eight乾, .eight亥:
                return ["七", "三", "五", "六", "八", "一", "二", "四", "九"]
            case .nine辰, .nine巽, .nine巳, .nine丙, .nine午, .nine丁, .nine未, .nine坤, .nine申, .nine甲, .nine卯, .nine乙, .nine庚, .nine酉, .nine辛, .nine丑, .nine艮, .nine寅, .nine壬, .nine子, .nine癸, .nine成, .nine乾, .nine亥:
                return ["八", "四", "六", "七", "九", "二", "三", "五", "一"]
            }
        }
        
        var baseNumbersRotated: [String] {
            switch self {
            case .one辰, .one巽, .one巳:
                return ["三", "二", "六", "七", "一", "四", "五", "九", "八"]
            case .one丙, .one午, .one丁:
                return ["二", "六", "四", "三", "一", "八", "七", "五", "九"]
            case .one未, .one坤, .one申:
                return ["六", "四", "八", "二", "一", "九", "三", "七", "五"]
            case .one甲, .one卯, .one乙:
                return ["七", "三", "二", "五", "一", "六", "九", "八", "四"]
            case .one庚, .one酉, .one辛:
                return ["四", "八", "九", "六", "一", "五", "二", "三", "七"]
            case .one丑, .one艮, .one寅:
                return ["五", "七", "三", "九", "一", "二", "八", "四", "六"]
            case .one壬, .one子, .one癸:
                return ["九", "五", "七", "八", "一", "三", "四", "六", "二"]
            case .one成, .one乾, .one亥:
                return ["八", "九", "五", "四", "一", "七", "六", "二", "三"]
            case .two辰, .two巽, .two巳:
                return ["四", "三", "七", "八", "二", "五", "六", "一", "九"]
            case .two丙, .two午, .two丁:
                return ["三", "七", "五", "四", "二", "九", "八", "六", "一"]
            case .two未, .two坤, .two申:
                return ["七", "五", "九", "三", "二", "一", "四", "八", "六"]
            case .two甲, .two卯, .two乙:
                return ["八", "四", "三", "六", "二", "七", "一", "九", "五"]
            case .two庚, .two酉, .two辛:
                return ["五", "九", "一", "七", "二", "六", "三", "四", "八"]
            case .two丑, .two艮, .two寅:
                return ["六", "八", "四", "一", "二", "三", "九", "五", "七"]
            case .two壬, .two子, .two癸:
                return ["一", "六", "八", "九", "二", "四", "五", "七", "三"]
            case .two成, .two乾, .two亥:
                return ["九", "一", "六", "五", "二", "八", "七", "三", "四"]
            case .three辰, .three巽, .three巳:
                return ["五", "四", "八", "九", "三", "六", "七", "二", "一"]
            case .three丙, .three午, .three丁:
                return ["四", "八", "六", "五", "三", "一", "九", "七", "二"]
            case .three未, .three坤, .three申:
                return ["八", "六", "一", "四", "三", "二", "五", "九", "七"]
            case .three甲, .three卯, .three乙:
                return ["九", "五", "四", "七", "三", "八", "二", "一", "六"]
            case .three庚, .three酉, .three辛:
                return ["六", "一", "二", "八", "三", "七", "四", "五", "九"]
            case .three丑, .three艮, .three寅:
                return ["七", "九", "五", "二", "三", "四", "一", "六", "八"]
            case .three壬, .three子, .three癸:
                return ["二", "七", "九", "一", "三", "五", "六", "八", "四"]
            case .three成, .three乾, .three亥:
                return ["一", "二", "七", "六", "三", "九", "八", "四", "五"]
            case .four辰, .four巽, .four巳:
                return ["六", "五", "九", "一", "四", "七", "八", "三", "二"]
            case .four丙, .four午, .four丁:
                return ["五", "九", "七", "六", "四", "二", "一", "八", "三"]
            case .four未, .four坤, .four申:
                return ["九", "七", "二", "五", "四", "三", "六", "一", "八"]
            case .four甲, .four卯, .four乙:
                return ["一", "六", "五", "八", "四", "九", "三", "二", "七"]
            case .four庚, .four酉, .four辛:
                return ["七", "二", "三", "九", "四", "八", "五", "六", "一"]
            case .four丑, .four艮, .four寅:
                return ["八", "一", "六", "三", "四", "五", "二", "七", "九"]
            case .four壬, .four子, .four癸:
                return ["三", "八", "一", "二", "四", "六", "七", "九", "五"]
            case .four成, .four乾, .four亥:
                return ["二", "三", "八", "七", "四", "一", "九", "五", "六"]
            case .five辰, .five巽, .five巳:
                return ["七", "六", "一", "二", "五", "八", "九", "四", "三"]
            case .five丙, .five午, .five丁:
                return ["六", "一", "八", "七", "五", "三", "二", "九", "四"]
            case .five未, .five坤, .five申:
                return ["一", "八", "三", "六", "五", "四", "七", "二", "九"]
            case .five甲, .five卯, .five乙:
                return ["二", "七", "六", "九", "五", "一", "四", "三", "八"]
            case .five庚, .five酉, .five辛:
                return ["八", "三", "四", "一", "五", "九", "六", "七", "二"]
            case .five丑, .five艮, .five寅:
                return ["九", "二", "七", "四", "五", "六", "三", "八", "一"]
            case .five壬, .five子, .five癸:
                return ["四", "九", "二", "三", "五", "七", "八", "一", "六"]
            case .five成, .five乾, .five亥:
                return ["三", "四", "九", "八", "五", "二", "一", "六", "七"]
            case .six辰, .six巽, .six巳:
                return ["八", "七", "二", "三", "六", "九", "一", "五", "四"]
            case .six丙, .six午, .six丁:
                return ["七", "二", "九", "八", "六", "四", "三", "一", "五"]
            case .six未, .six坤, .six申:
                return ["二", "九", "四", "七", "六", "五", "八", "三", "一"]
            case .six甲, .six卯, .six乙:
                return ["三", "八", "七", "一", "六", "二", "五", "四", "九"]
            case .six庚, .six酉, .six辛:
                return ["九", "四", "五", "二", "六", "一", "七", "八", "三"]
            case .six丑, .six艮, .six寅:
                return ["一", "三", "八", "五", "六", "七", "四", "九", "二"]
            case .six壬, .six子, .six癸:
                return ["五", "一", "三", "四", "六", "八", "九", "二", "七"]
            case .six成, .six乾, .six亥:
                return ["四", "五", "一", "九", "六", "三", "二", "七", "八"]
            case .seven辰, .seven巽, .seven巳:
                return ["九", "八", "三", "四", "七", "一", "二", "六", "五"]
            case .seven丙, .seven午, .seven丁:
                return ["八", "三", "一", "九", "七", "五", "四", "二", "六"]
            case .seven未, .seven坤, .seven申:
                return ["三", "一", "五", "八", "七", "六", "九", "四", "二"]
            case .seven甲, .seven卯, .seven乙:
                return ["四", "九", "八", "二", "七", "三", "六", "五", "一"]
            case .seven庚, .seven酉, .seven辛:
                return ["一", "五", "六", "三", "七", "二", "八", "九", "四"]
            case .seven丑, .seven艮, .seven寅:
                return ["二", "四", "九", "六", "七", "八", "五", "一", "三"]
            case .seven壬, .seven子, .seven癸:
                return ["六", "二", "四", "五", "七", "九", "一", "三", "八"]
            case .seven成, .seven乾, .seven亥:
                return ["五", "六", "二", "一", "七", "四", "三", "八", "九"]
            case .eight辰, .eight巽, .eight巳:
                return ["一", "九", "四", "五", "八", "二", "三", "七", "六"]
            case .eight丙, .eight午, .eight丁:
                return ["九", "四", "二", "一", "八", "六", "五", "三", "七"]
            case .eight未, .eight坤, .eight申:
                return ["四", "二", "六", "九", "八", "七", "一", "五", "三"]
            case .eight甲, .eight卯, .eight乙:
                return ["五", "一", "九", "三", "八", "四", "七", "六", "二"]
            case .eight庚, .eight酉, .eight辛:
                return ["二", "六", "七", "四", "八", "三", "九", "一", "五"]
            case .eight丑, .eight艮, .eight寅:
                return ["三", "五", "一", "七", "八", "九", "六", "二", "四"]
            case .eight壬, .eight子, .eight癸:
                return ["七", "三", "五", "六", "八", "一", "二", "四", "九"]
            case .eight成, .eight乾, .eight亥:
                return ["六", "七", "三", "二", "八", "五", "四", "九", "一"]
            case .nine辰, .nine巽, .nine巳:
                return ["二", "一", "五", "六", "九", "三", "四", "八", "七"]
            case .nine丙, .nine午, .nine丁:
                return ["一", "五", "三", "二", "九", "七", "六", "四", "八"]
            case .nine未, .nine坤, .nine申:
                return ["五", "三", "七", "一", "九", "八", "二", "六", "四"]
            case .nine甲, .nine卯, .nine乙:
                return ["六", "二", "一", "四", "九", "五", "八", "七", "三"]
            case .nine庚, .nine酉, .nine辛:
                return ["三", "七", "八", "五", "九", "四", "一", "二", "六"]
            case .nine丑, .nine艮, .nine寅:
                return ["四", "六", "二", "八", "九", "一", "七", "三", "五"]
            case .nine壬, .nine子, .nine癸:
                return ["八", "四", "六", "七", "九", "二", "三", "五", "一"]
            case .nine成, .nine乾, .nine亥:
                return ["七", "八", "四", "三", "九", "六", "五", "一", "二"]
            }
        }
        
        // MARK: - Location numbers
        
        var locationNumbers: [String] {
            switch self {
            case .one辰, .two甲, .three未, .four壬, .five丙, .six丑, .seven庚, .eight成:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .one巽, .one巳, .two卯, .two乙, .three坤, .three申, .four子, .four癸, .five午, .five丁, .six艮, .six寅, .seven酉, .seven辛, .eight乾, .eight亥:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .one丙, .two艮, .two寅, .three庚, .four乾, .four亥, .six巽, .six巳, .seven甲, .eight坤, .eight申, .nine壬:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one午, .one丁, .two丑, .three酉, .three辛, .four成, .six辰, .seven卯, .seven乙, .eight未, .nine子, .nine癸:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one未, .two壬, .three丙, .four丑, .five庚, .six成, .eight辰, .nine甲:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .one坤, .one申, .two子, .two癸, .three午, .three丁, .four艮, .four寅, .five酉, .five辛, .six乾, .six亥, .eight巽, .eight巳, .nine卯, .nine乙:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .one甲, .two未, .three壬, .four丙, .five丑, .six庚, .seven成, .nine辰:
                return ["9", "4", "2", "1", "8", "6", "5", "3", "7"]
            case .one卯, .one乙, .two坤, .two申, .three子, .three癸, .four午, .four丁, .five艮, .five寅, .six酉, .six辛, .seven乾, .seven亥, .nine巽, .nine巳:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            case .one庚, .two成, .four辰, .five甲, .six未, .seven壬, .eight丙, .nine丑:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .one酉, .one辛, .two乾, .two亥, .four巽, .four巳, .five卯, .five乙, .six坤, .six申, .seven子, .seven癸, .eight午, .eight丁, .nine艮, .nine寅:
                return ["4", "8", "6", "5", "3", "1", "9", "7", "2"]
            case .one丑, .two庚, .three成, .five辰, .six甲, .seven未, .eight壬, .nine丙:
                return ["5", "9", "7", "6", "4", "2", "1", "8", "3"]
            case .one艮, .one寅, .two酉, .two辛, .three乾, .three亥, .five巽, .five巳, .six卯, .six乙, .seven坤, .seven申, .eight子, .eight癸, .nine午, .nine丁:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            case .one壬, .two丙, .three丑, .four庚, .five成, .seven辰, .eight甲, .nine未:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one子, .one癸, .two午, .two丁, .three艮, .three寅, .four酉, .four辛, .five乾, .five亥, .seven巽, .seven巳, .eight卯, .eight乙, .nine坤, .nine申:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one成, .three辰, .four甲, .five未, .six壬, .seven丙, .eight丑, .nine庚:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .one乾, .one亥, .three巽, .three巳, .four卯, .four乙, .five坤, .five申, .six子, .six癸, .seven午, .seven丁, .eight艮, .eight寅, .nine酉, .nine辛:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .two辰, .three甲, .four未, .five壬, .six丙, .seven丑, .eight庚, .nine成:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .two巽, .two巳, .three卯, .three乙, .four坤, .four申, .five子, .five癸, .six午, .six丁, .seven艮, .seven寅, .eight酉, .eight辛, .nine乾, .nine亥:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            }
        }
        
        var locationNumbersRotated: [String] {
            switch self {
            case .one辰, .eight乾, .eight亥:
                return ["2", "1", "5", "6", "9", "3", "4", "8", "7"]
            case .one巽, .one巳, .eight成:
                return ["7", "8", "4", "3", "9", "6", "5", "1", "2"]
            case .one丙, .nine子, .nine癸:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one午, .one丁, .nine壬:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one未, .four艮, .four寅:
                return ["3", "1", "5", "8", "7", "6", "9", "4", "2"]
            case .one坤, .one申, .four丑:
                return ["2", "4", "9", "6", "7", "8", "5", "1", "3"]
            case .one甲, .six酉, .six辛:
                return ["2", "6", "7", "4", "8", "3", "9", "1", "5"]
            case .one卯, .one乙, .six庚:
                return ["5", "1", "9", "3", "8", "4", "7", "6", "2"]
            case .one庚, .five卯, .five乙:
                return ["6", "1", "2", "8", "3", "7", "4", "5", "9"]
            case .one酉, .one辛, .five甲:
                return ["9", "5", "4", "7", "3", "8", "2", "1", "6"]
            case .one丑, .seven坤, .seven申:
                return ["9", "7", "2", "5", "4", "3", "6", "1", "8"]
            case .one艮, .one寅, .seven未:
                return ["8", "1", "6", "3", "4", "5", "2", "7", "9"]
            case .one壬, .two午, .two丁:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one子, .one癸, .two丙:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one成, .three巽, .three巳:
                return ["4", "3", "7", "8", "2", "5", "6", "1", "9"]
            case .one乾, .one亥, .three辰:
                return ["9", "1", "6", "5", "2", "8", "7", "3", "4"]
            case .two辰, .nine乾, .nine亥:
                return ["3", "2", "6", "7", "1", "4", "5", "9", "8"]
            case .two巽, .two巳, .nine成:
                return ["8", "9", "5", "4", "1", "7", "6", "2", "3"]
            case .two未, .five艮, .five寅:
                return ["3", "5", "1", "7", "8", "9", "6", "2", "4"]
            case .two坤, .two申, .five丑:
                return ["4", "2", "6", "9", "8", "7", "1", "5", "3"]
            case .two甲, .seven酉, .seven辛:
                return ["6", "2", "1", "4", "9", "5", "8", "7", "3"]
            case .two卯, .two乙, .seven庚:
                return ["3", "7", "8", "5", "9", "4", "1", "2", "6"]
            case .two庚, .six卯, .six乙:
                return ["1", "6", "5", "8", "4", "9", "3", "2", "7"]
            case .two酉, .two辛, .six甲:
                return ["7", "2", "3", "9", "4", "8", "5", "6", "1"]
            case .two丑, .eight坤, .eight申:
                return ["1", "8", "3", "6", "5", "4", "7", "2", "9"]
            case .two艮, .two寅, .eight未:
                return ["9", "2", "7", "4", "5", "6", "3", "8", "1"]
            case .two壬, .three午, .three丁:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .two子, .two癸, .three丙:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .two成, .four巽, .four巳:
                return ["1", "2", "7", "6", "3", "9", "8", "4", "5"]
            case .two乾, .two亥, .four辰:
                return ["5", "4", "8", "9", "3", "6", "7", "2", "1"]
            case .three未, .six艮, .six寅:
                return ["5", "3", "7", "1", "9", "8", "2", "6", "4"]
            case .three坤, .three申, .six丑:
                return ["4", "6", "2", "8", "9", "1", "7", "3", "5"]
            case .three甲, .eight酉, .eight辛:
                return ["7", "3", "2", "5", "1", "6", "9", "8", "4"]
            case .three卯, .three乙, .eight庚:
                return ["4", "8", "9", "6", "1", "5", "2", "3", "7"]
            case .three庚, .seven卯, .seven乙:
                return ["8", "3", "4", "1", "5", "9", "6", "7", "2"]
            case .three酉, .three辛, .seven甲:
                return ["2", "7", "6", "9", "5", "1", "4", "3", "8"]
            case .three丑, .nine坤, .nine申:
                return ["2", "9", "4", "7", "6", "5", "8", "3", "1"]
            case .three艮, .three寅, .nine未:
                return ["1", "3", "8", "5", "6", "7", "4", "9", "2"]
            case .three壬, .four午, .four丁:
                return ["9", "4", "2", "1", "8", "6", "5", "3", "7"]
            case .three子, .three癸, .four丙:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            case .three成, .five巽, .five巳:
                return ["6", "5", "9", "1", "4", "7", "8", "3", "2"]
            case .three乾, .three亥, .five辰:
                return ["2", "3", "8", "7", "4", "1", "9", "5", "6"]
            case .four未, .seven艮, .seven寅:
                return ["6", "4", "8", "2", "1", "9", "3", "7", "5"]
            case .four坤, .four申, .seven丑:
                return ["5", "7", "3", "9", "1", "2", "8", "4", "6"]
            case .four甲, .nine酉, .nine辛:
                return ["5", "9", "1", "7", "2", "6", "3", "4", "8"]
            case .four卯, .four乙, .nine庚:
                return ["8", "4", "3", "6", "2", "7", "1", "9", "5"]
            case .four庚, .eight卯, .eight乙:
                return ["3", "8", "7", "1", "6", "2", "5", "4", "9"]
            case .four酉, .four辛, .eight甲:
                return ["9", "4", "5", "2", "6", "1", "7", "8", "3"]
            case .four壬, .five午, .five丁:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .four子, .four癸, .five丙:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .four成, .six巽, .six巳:
                return ["7", "6", "1", "2", "5", "8", "9", "4", "3"]
            case .four乾, .four亥, .six辰:
                return ["3", "4", "9", "8", "5", "2", "1", "6", "7"]
            case .five未, .eight艮, .eight寅:
                return ["6", "8", "4", "1", "2", "3", "9", "5", "7"]
            case .five坤, .five申, .eight丑:
                return ["7", "5", "9", "3", "2", "1", "4", "8", "6"]
            case .five庚, .nine卯, .nine乙:
                return ["1", "5", "6", "3", "7", "2", "8", "9", "4"]
            case .five酉, .five辛, .nine甲:
                return ["4", "9", "8", "2", "7", "3", "6", "5", "1"]
            case .five壬, .six午, .six丁:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .five子, .five癸, .six丙:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            case .five成, .seven巽, .seven巳:
                return ["8", "7", "2", "3", "6", "9", "1", "5", "4"]
            case .five乾, .five亥, .seven辰:
                return ["4", "5", "1", "9", "6", "3", "2", "7", "8"]
            case .six未, .nine艮, .nine寅:
                return ["8", "6", "1", "4", "3", "2", "5", "9", "7"]
            case .six坤, .six申, .nine丑:
                return ["7", "9", "5", "2", "3", "4", "1", "6", "8"]
            case .six壬, .seven午, .seven丁:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .six子, .six癸, .seven丙:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .six成, .eight巽, .eight巳:
                return ["5", "6", "2", "1", "7", "4", "3", "8", "9"]
            case .six乾, .six亥, .eight辰:
                return ["9", "8", "3", "4", "7", "1", "2", "6", "5"]
            case .seven壬, .eight午, .eight丁:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .seven子, .seven癸, .eight丙:
                return ["4", "8", "6", "5", "3", "1", "9", "7", "2"]
            case .seven成, .nine巽, .nine巳:
                return ["1", "9", "4", "5", "8", "2", "3", "7", "6"]
            case .seven乾, .seven亥, .nine辰:
                return ["6", "7", "3", "2", "8", "5", "4", "9", "1"]
            case .eight壬, .nine午, .nine丁:
                return ["5", "9", "7", "6", "4", "2", "1", "8", "3"]
            case .eight子, .eight癸, .nine丙:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            }
        }
        
        // MARK: - Direction numbers
        
        var directionNumbers: [String] {
            switch self {
            case .one辰, .three成, .four庚, .five丑, .six丙, .seven壬, .eight未, .nine甲:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .one巽, .one巳, .three乾, .three亥, .four酉, .four辛, .five艮, .five寅, .six午, .six丁, .seven子, .seven癸, .eight坤, .eight申, .nine卯, .nine乙:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .one丙, .two壬, .three未, .four甲, .five辰, .seven成, .eight庚, .nine丑:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one午, .one丁, .two子, .two癸, .three坤, .three申, .four卯, .four乙, .five巽, .five巳, .seven乾, .seven亥, .eight酉, .eight辛, .nine艮, .nine寅:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one未, .two甲, .three辰, .five成, .six庚, .seven丑, .eight丙, .nine壬:
                return ["5", "9", "7", "6", "4", "2", "1", "8", "3"]
            case .one坤, .one申, .two卯, .two乙, .three巽, .three巳, .five乾, .five亥, .six酉, .six辛, .seven艮, .seven寅, .eight午, .eight丁, .nine子, .nine癸:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            case .one甲, .two辰, .four成, .five庚, .six丑, .seven丙, .eight壬, .nine未:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .one卯, .one乙, .two巽, .two巳, .four乾, .four亥, .five酉, .five辛, .six艮, .six寅, .seven午, .seven丁, .eight子, .eight癸, .nine坤, .nine申:
                return ["4", "8", "6", "5", "3", "1", "9", "7", "2"]
            case .one庚, .two丑, .three丙, .four壬, .five未, .six甲, .seven辰, .nine成:
                return ["9", "4", "2", "1", "8", "6", "5", "3", "7"]
            case .one酉, .one辛, .two艮, .two寅, .three午, .three丁, .four子, .four癸, .five坤, .five申, .six卯, .six乙, .seven巽, .seven巳, .nine乾, .nine亥:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            case .one丑, .two丙, .three壬, .four未, .five甲, .six辰, .eight成, .nine庚:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .one艮, .one寅, .two午, .two丁, .three子, .three癸, .four坤, .four申, .five卯, .five乙, .six巽, .six巳, .eight乾, .eight亥, .nine酉, .nine辛:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .one壬, .two坤, .two申, .three甲, .four巽, .four巳, .six乾, .six亥, .seven庚, .eight艮, .eight寅, .nine丙:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one子, .one癸, .two未, .three卯, .three乙, .four辰, .six成, .seven酉, .seven辛, .eight丑, .nine午, .nine丁:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one成, .two庚, .three丑, .four丙, .five壬, .six未, .seven甲, .eight辰:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .one乾, .one亥, .two酉, .two辛, .three艮, .three寅, .four午, .four丁, .five子, .five癸, .six坤, .six申, .seven卯, .seven乙, .eight巽, .eight巳:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .two成, .three庚, .four丑, .five丙, .six壬, .seven未, .eight甲, .nine辰:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .two乾, .two亥, .three酉, .three辛, .four艮, .four寅, .five午, .five丁, .six子, .six癸, .seven坤, .seven申, .eight卯, .eight乙, .nine巽, .nine巳:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            }
        }
        
        var directionNumbersRotated: [String] {
            switch self {
            case .one辰, .three乾, .three亥:
                return ["9", "1", "6", "5", "2", "8", "7", "3", "4"]
            case .one巽, .one巳:
                return ["4", "3", "7", "8", "2", "5", "6", "1", "9"]
            case .one丙, .two子, .two癸:
                return ["5", "1", "3", "4", "6", "8", "9", "2", "7"]
            case .one午, .one丁, .two壬:
                return ["7", "2", "9", "8", "6", "4", "3", "1", "5"]
            case .one未, .seven艮, .seven寅:
                return ["8", "1", "6", "3", "4", "5", "2", "7", "9"]
            case .one坤, .one申, .seven丑:
                return ["9", "7", "2", "5", "4", "3", "6", "1", "8"]
            case .one甲, .five酉, .five辛:
                return ["9", "5", "4", "7", "3", "8", "2", "1", "6"]
            case .one卯, .one乙, .five庚:
                return ["6", "1", "2", "8", "3", "7", "4", "5", "9"]
            case .one庚, .six卯, .six乙:
                return ["5", "1", "9", "3", "8", "4", "7", "6", "2"]
            case .one酉, .one辛, .six甲:
                return ["2", "6", "7", "4", "8", "3", "9", "1", "5"]
            case .one丑, .four坤, .four申:
                return ["2", "4", "9", "6", "7", "8", "5", "1", "3"]
            case .one艮, .one寅, .four未:
                return ["3", "1", "5", "8", "7", "6", "9", "4", "2"]
            case .one壬, .nine午, .nine丁:
                return ["4", "9", "2", "3", "5", "7", "8", "1", "6"]
            case .one子, .one癸, .nine丙:
                return ["6", "1", "8", "7", "5", "3", "2", "9", "4"]
            case .one成, .eight巽, .eight巳:
                return ["7", "8", "4", "3", "9", "6", "5", "1", "2"]
            case .one乾, .one亥, .eight辰:
                return ["2", "1", "5", "6", "9", "3", "4", "8", "7"]
            case .two辰, .four乾, .four亥:
                return ["5", "4", "8", "9", "3", "6", "7", "2", "1"]
            case .two巽, .two巳, .four成:
                return ["1", "2", "7", "6", "3", "9", "8", "4", "5"]
            case .two丙, .three子, .three癸:
                return ["8", "3", "1", "9", "7", "5", "4", "2", "6"]
            case .two午, .two丁, .three壬:
                return ["6", "2", "4", "5", "7", "9", "1", "3", "8"]
            case .two未, .eight艮, .eight寅:
                return ["9", "2", "7", "4", "5", "6", "3", "8", "1"]
            case .two坤, .two申, .eight丑:
                return ["1", "8", "3", "6", "5", "4", "7", "2", "9"]
            case .two甲, .six酉, .six辛:
                return ["7", "2", "3", "9", "4", "8", "5", "6", "1"]
            case .two卯, .two乙, .six庚:
                return ["1", "6", "5", "8", "4", "9", "3", "2", "7"]
            case .two庚, .seven卯, .seven乙:
                return ["3", "7", "8", "5", "9", "4", "1", "2", "6"]
            case .two酉, .two辛, .seven甲:
                return ["6", "2", "1", "4", "9", "5", "8", "7", "3"]
            case .two丑, .five坤, .five申:
                return ["4", "2", "6", "9", "8", "7", "1", "5", "3"]
            case .two艮, .two寅, .five未:
                return ["3", "5", "1", "7", "8", "9", "6", "2", "4"]
            case .two成, .nine巽, .nine巳:
                return ["8", "9", "5", "4", "1", "7", "6", "2", "3"]
            case .two乾, .two亥, .nine辰:
                return ["3", "2", "6", "7", "1", "4", "5", "9", "8"]
            case .three辰, .five乾, .five亥:
                return ["2", "3", "8", "7", "4", "1", "9", "5", "6"]
            case .three巽, .three巳, .five成:
                return ["6", "5", "9", "1", "4", "7", "8", "3", "2"]
            case .three丙, .four子, .four癸:
                return ["7", "3", "5", "6", "8", "1", "2", "4", "9"]
            case .three午, .three丁, .four壬:
                return ["9", "4", "2", "1", "8", "6", "5", "3", "7"]
            case .three未, .nine艮, .nine寅:
                return ["1", "3", "8", "5", "6", "7", "4", "9", "2"]
            case .three坤, .three申, .nine丑:
                return ["2", "9", "4", "7", "6", "5", "8", "3", "1"]
            case .three甲, .seven酉, .seven辛:
                return ["2", "7", "6", "9", "5", "1", "4", "3", "8"]
            case .three卯, .three乙, .seven庚:
                return ["8", "3", "4", "1", "5", "9", "6", "7", "2"]
            case .three庚, .eight卯, .eight乙:
                return ["4", "8", "9", "6", "1", "5", "2", "3", "7"]
            case .three酉, .three辛, .eight甲:
                return ["7", "3", "2", "5", "1", "6", "9", "8", "4"]
            case .three丑, .six坤, .six申:
                return ["4", "6", "2", "8", "9", "1", "7", "3", "5"]
            case .three艮, .three寅, .six未:
                return ["5", "3", "7", "1", "9", "8", "2", "6", "4"]
            case .three成:
                return ["4", "3", "7", "8", "2", "5", "6", "1", "9"]
            case .four辰, .six乾, .six亥:
                return ["3", "4", "9", "8", "5", "2", "1", "6", "7"]
            case .four巽, .four巳, .six成:
                return ["7", "6", "1", "2", "5", "8", "9", "4", "3"]
            case .four丙, .five子, .five癸:
                return ["1", "5", "3", "2", "9", "7", "6", "4", "8"]
            case .four午, .four丁, .five壬:
                return ["8", "4", "6", "7", "9", "2", "3", "5", "1"]
            case .four甲, .eight酉, .eight辛:
                return ["9", "4", "5", "2", "6", "1", "7", "8", "3"]
            case .four卯, .four乙, .eight庚:
                return ["3", "8", "7", "1", "6", "2", "5", "4", "9"]
            case .four庚, .nine卯, .nine乙:
                return ["8", "4", "3", "6", "2", "7", "1", "9", "5"]
            case .four酉, .four辛, .nine甲:
                return ["5", "9", "1", "7", "2", "6", "3", "4", "8"]
            case .four丑, .seven坤, .seven申:
                return ["5", "7", "3", "9", "1", "2", "8", "4", "6"]
            case .four艮, .four寅, .seven未:
                return ["6", "4", "8", "2", "1", "9", "3", "7", "5"]
            case .five辰, .seven乾, .seven亥:
                return ["4", "5", "1", "9", "6", "3", "2", "7", "8"]
            case .five巽, .five巳, .seven成:
                return ["8", "7", "2", "3", "6", "9", "1", "5", "4"]
            case .five丙, .six子, .six癸:
                return ["2", "6", "4", "3", "1", "8", "7", "5", "9"]
            case .five午, .five丁, .six壬:
                return ["9", "5", "7", "8", "1", "3", "4", "6", "2"]
            case .five甲, .nine酉, .nine辛:
                return ["4", "9", "8", "2", "7", "3", "6", "5", "1"]
            case .five卯, .five乙, .nine庚:
                return ["1", "5", "6", "3", "7", "2", "8", "9", "4"]
            case .five丑, .eight坤, .eight申:
                return ["7", "5", "9", "3", "2", "1", "4", "8", "6"]
            case .five艮, .five寅, .eight未:
                return ["6", "8", "4", "1", "2", "3", "9", "5", "7"]
            case .six辰, .eight乾, .eight亥:
                return ["9", "8", "3", "4", "7", "1", "2", "6", "5"]
            case .six巽, .six巳, .eight成:
                return ["5", "6", "2", "1", "7", "4", "3", "8", "9"]
            case .six丙, .seven子, .seven癸:
                return ["1", "6", "8", "9", "2", "4", "5", "7", "3"]
            case .six午, .six丁, .seven壬:
                return ["3", "7", "5", "4", "2", "9", "8", "6", "1"]
            case .six丑, .nine坤, .nine申:
                return ["7", "9", "5", "2", "3", "4", "1", "6", "8"]
            case .six艮, .six寅, .nine未:
                return ["8", "6", "1", "4", "3", "2", "5", "9", "7"]
            case .seven辰, .nine乾, .nine亥:
                return ["6", "7", "3", "2", "8", "5", "4", "9", "1"]
            case .seven巽, .seven巳, .nine成:
                return ["1", "9", "4", "5", "8", "2", "3", "7", "6"]
            case .seven丙, .eight子, .eight癸:
                return ["4", "8", "6", "5", "3", "1", "9", "7", "2"]
            case .seven午, .seven丁, .eight壬:
                return ["2", "7", "9", "1", "3", "5", "6", "8", "4"]
            case .eight丙, .nine子, .nine癸:
                return ["3", "8", "1", "2", "4", "6", "7", "9", "5"]
            case .eight午, .eight丁, .nine壬:
                return ["5", "9", "7", "6", "4", "2", "1", "8", "3"]
            }
        }
        
        // MARK: - Cardinal characters
        
        var cardinalCharacters: [String] {
            ["巽", "离", "坤", "震", "", "兌", "艮", "坎", "乾"]
        }
        
        var cardinalCharactersRotated: [String] {
            switch self {
            case .one辰, .one巽, .one巳, .two辰, .two巽, .two巳, .three辰, .three巽, .three巳, .four辰, .four巽, .four巳, .five辰, .five巽, .five巳, .six辰, .six巽, .six巳, .seven辰, .seven巽, .seven巳, .eight辰, .eight巽, .eight巳, .nine辰, .nine巽, .nine巳:
                return ["兌", "乾", "坎", "坤", "", "艮", "离", "巽", "震"]
            case .one丙, .one午, .one丁, .two丙, .two午, .two丁, .three丙, .three午, .three丁, .four丙, .four午, .four丁, .five丙, .five午, .five丁, .six丙, .six午, .six丁, .seven丙, .seven午, .seven丁, .eight丙, .eight午, .eight丁, .nine丙, .nine午, .nine丁:
                return ["乾", "坎", "艮", "兌", "", "震", "坤", "离", "巽"]
            case .one未, .one坤, .one申, .two未, .two坤, .two申, .three未, .three坤, .three申, .four未, .four坤, .four申, .five未, .five坤, .five申, .six未, .six坤, .six申, .seven未, .seven坤, .seven申, .eight未, .eight坤, .eight申, .nine未, .nine坤, .nine申:
                return ["坎", "艮", "震", "乾", "", "巽", "兌", "坤", "离"]
            case .one甲, .one卯, .one乙, .two甲, .two卯, .two乙, .three甲, .three卯, .three乙, .four甲, .four卯, .four乙, .five甲, .five卯, .five乙, .six甲, .six卯, .six乙, .seven甲, .seven卯, .seven乙, .eight甲, .eight卯, .eight乙, .nine甲, .nine卯, .nine乙:
                return ["坤", "兌", "乾", "离", "", "坎", "巽", "震", "艮"]
            case .one庚, .one酉, .one辛, .two庚, .two酉, .two辛, .three庚, .three酉, .three辛, .four庚, .four酉, .four辛, .five庚, .five酉, .five辛, .six庚, .six酉, .six辛, .seven庚, .seven酉, .seven辛, .eight庚, .eight酉, .eight辛, .nine庚, .nine酉, .nine辛:
                return ["艮", "震", "巽", "坎", "", "离", "乾", "兌", "坤"]
            case .one丑, .one艮, .one寅, .two丑, .two艮, .two寅, .three丑, .three艮, .three寅, .four丑, .four艮, .four寅, .five丑, .five艮, .five寅, .six丑, .six艮, .six寅, .seven丑, .seven艮, .seven寅, .eight丑, .eight艮, .eight寅, .nine丑, .nine艮, .nine寅:
                return ["离", "坤", "兌", "巽", "", "乾", "震", "艮", "坎"]
            case .one壬, .one子, .one癸, .two壬, .two子, .two癸, .three壬, .three子, .three癸, .four壬, .four子, .four癸, .five壬, .five子, .five癸, .six壬, .six子, .six癸, .seven壬, .seven子, .seven癸, .eight壬, .eight子, .eight癸, .nine壬, .nine子, .nine癸:
                return ["巽", "离", "坤", "震", "", "兌", "艮", "坎", "乾"]
            case .one成, .one乾, .one亥, .two成, .two乾, .two亥, .three成, .three乾, .three亥, .four成, .four乾, .four亥, .five成, .five乾, .five亥, .six成, .six乾, .six亥, .seven成, .seven乾, .seven亥, .eight成, .eight乾, .eight亥, .nine成, .nine乾, .nine亥:
                return ["震", "巽", "离", "艮", "", "坤", "坎", "乾", "兌"]
            }
        }
    }
}
