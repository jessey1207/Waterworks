//
//  GridViewModel.swift
//  风水
//
//  Created by Jessey Fung on 19/4/22.
//

import Foundation

class GridViewModel {
    private let userInput: UserInput
    private let originalGrid = OriginalGrid()
    private let rotated: Bool

    init(userInput: UserInput, rotated: Bool) {
        self.userInput = userInput
        self.rotated = rotated
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
        guard let items = locationItems else { return Constants.Grid.Item.unknownText }
        return String(items[index].number)
    }

    /// Retrieves the direction number to be displayed.
    ///
    /// - Parameter index: Grid index where number is to be displayed in.
    /// - Returns: The direction number as a String.
    func directionNumber(at index: Int) -> String {
        guard let items = directionItems else { return Constants.Grid.Item.unknownText }
        return String(items[index].number)
    }

    /// Retrieves the cardinal character to be displayed.
    /// There is no cardinal character for the middle grid item (when index is 4).
    ///
    /// - Parameter index: Grid index where character is to be displayed in.
    /// - Returns: The character as a String.
    func cardinalCharacter(at index: Int) -> String {
        return cardinalItems[index]
    }

    // MARK: - Private properties

    private var baseItems: [GridItemModel] {
        let items = GridFormula.clockwise.generateGridItems(
            centre: userInput.luck.rawValue
        )
        return rotated
        ? items.rearranged(for: userInput.direction)
        : items
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

        let items = location.rotation == .clockwise
        ? GridFormula.clockwise.generateGridItems(centre: baseNumberContainingLocation)
        : GridFormula.anticlockwise.generateGridItems(centre: baseNumberContainingLocation)

        return rotated
        ? items.rearranged(for: userInput.direction)
        : items
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

        let items = direction.rotation == .clockwise
        ? GridFormula.clockwise.generateGridItems(centre: baseNumberContainingDirection)
        : GridFormula.anticlockwise.generateGridItems(centre: baseNumberContainingDirection)

        return rotated
        ? items.rearranged(for: userInput.direction)
        : items
    }

    private var cardinalItems: [String] {
        var items = CardinalPoint.allCases
            .filter({ $0 != .unknown })
            .map { $0.chineseRepresentation }
        items.insert("", at: CardinalPoint.allCases.count / 2) // middle item has no cardinal point
        return rotated
        ? items.rearranged(for: userInput.direction)
        : items
    }
}
