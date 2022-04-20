//
//  GridViewModel.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

class GridViewViewModel {
    private let userInput: UserInput
    private let originalGrid = OriginalGrid()

    init(userInput: UserInput) {
        self.userInput = userInput
    }

    /// Retrieves the base number to be displayed.
    ///
    /// - Parameter index: Grid index where number is to be displayed in.
    /// - Returns: The base number as a String translated to Chinese.
    func baseNumber(at index: Int) -> String {
        String(baseItems[index].number).translatedToChinese()
    }

    /// Retrieves the location number to be displayed.
    ///
    /// - Parameter index: Grid index where number is to be displayed in.
    /// - Returns: The location number as a String.
    func locationNumber(at index: Int) -> String {
        guard let items = locationItems else { return Constants.GridItem.unknownText }
        return String(items[index].number)
    }

    /// Retrieves the direction number to be displayed.
    ///
    /// - Parameter index: Grid index where number is to be displayed in.
    /// - Returns: The direction number as a String.
    func directionNumber(at index: Int) -> String {
        guard let items = directionItems else { return Constants.GridItem.unknownText }
        return String(items[index].number)
    }

    // MARK: - Private properties

    private var baseItems: [GridItemModel] {
        GridFormula.clockwise.generateGridItems(
            centre: userInput.luck.rawValue
        )
    }

    private var locationItems: [GridItemModel]? {
        guard let baseNumberContainingLocation = baseItems
            .first(where: { $0.locations.contains(userInput.location) })?
            .number
        else { return nil }

        var numberToMatchOnOriginal: Int? {
            guard baseNumberContainingLocation == 5 else {
                return baseNumberContainingLocation
            }
            return baseItems.first { item in
                item.number == userInput.luck.rawValue
            }?.number
        }

        guard let numberToMatchOnOriginal = numberToMatchOnOriginal else { return nil }

        let location = originalGrid.getLocation(
            from: numberToMatchOnOriginal,
            at: userInput.location.index
        )

        return location.rotation == .clockwise
        ? GridFormula.clockwise.generateGridItems(centre: baseNumberContainingLocation)
        : GridFormula.anticlockwise.generateGridItems(centre: baseNumberContainingLocation)
    }

    private var directionItems: [GridItemModel]? {
        guard let baseNumberContainingDirection = baseItems
            .first(where: { $0.directions.contains(userInput.direction) })?
            .number
        else { return nil }

        var numberToMatchOnOriginal: Int? {
            guard baseNumberContainingDirection == 5 else {
                return baseNumberContainingDirection
            }
            return baseItems.first { item in
                item.number == userInput.luck.rawValue
            }?.number
        }

        guard let numberToMatchOnOriginal = numberToMatchOnOriginal else { return nil }

        let direction = originalGrid.getDirection(
            from: numberToMatchOnOriginal,
            at: userInput.direction.index
        )

        return direction.rotation == .clockwise
        ? GridFormula.clockwise.generateGridItems(centre: baseNumberContainingDirection)
        : GridFormula.anticlockwise.generateGridItems(centre: baseNumberContainingDirection)
    }
}
