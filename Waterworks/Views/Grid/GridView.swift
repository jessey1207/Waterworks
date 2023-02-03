//
//  GridView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct GridView: View {
    @ObservedObject private var viewModel: ViewModel
    @Binding var rotated: Bool

    init(
        userInput: UserInput,
        rotated: Binding<Bool>
    ) {
        viewModel = .init(
            userInput: userInput,
            rotated: rotated.wrappedValue
        )
        self._rotated = rotated
    }
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: Constants.Grid.spacing) {
            ForEach(0..<9, id: \.self) { index in
                gridItem(index: index)
            }
        }
        .frame(maxWidth: maxWidth)
        .padding(30)
        .overlay(
            arrowsView
        )
        .animation(.easeInOut, value: viewModel.userInput.luck)
        .animation(.easeInOut, value: viewModel.userInput.location)
        .animation(.easeInOut, value: viewModel.userInput.year.number)
        .animation(.easeInOut, value: rotated)
    }

    private let layout = Array(
        repeating: GridItem(.fixed(Constants.Grid.Item.width), spacing: Constants.Grid.spacing),
        count: 3
    )

    private var maxWidth: CGFloat {
        let itemsWidth = Constants.Grid.Item.width * CGFloat(layout.count)
        let spacing = Constants.Grid.spacing * CGFloat(layout.count - 1)
        return itemsWidth + spacing
    }

    @ViewBuilder
    private func gridItem(index: Int) -> some View {
        if viewModel.userInput.isInvalid {
            GridItemView(
                baseNumber: Constants.Grid.Item.unknownText,
                locationNumber: Constants.Grid.Item.unknownText,
                directionNumber: Constants.Grid.Item.unknownText,
                cardinalCharacter: Constants.Grid.Item.unknownText,
                yearNumber: viewModel.yearNumber(at: index),
                isVisibleEvilIcon: viewModel.isVisibleEvilText(at: index),
                isVisibleAgeIcon: viewModel.isVisibleAgeText(at: index),
                isVisibleStrengthIcon: viewModel.isVisibleStrength(at: index)
            )
        } else {
            GridItemView(
                baseNumber: viewModel.baseNumber(at: index),
                locationNumber: viewModel.locationNumber(at: index),
                directionNumber: viewModel.directionNumber(at: index),
                cardinalCharacter: viewModel.cardinalCharacter(at: index),
                yearNumber: viewModel.yearNumber(at: index),
                isVisibleEvilIcon: viewModel.isVisibleEvilText(at: index),
                isVisibleAgeIcon: viewModel.isVisibleAgeText(at: index),
                isVisibleStrengthIcon: viewModel.isVisibleStrength(at: index)
            )
        }
    }

    @ViewBuilder
    private var arrowsView: some View {
        ArrowsView(
            userInput: viewModel.userInput,
            rotated: $rotated
        )
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridView(
                userInput: UserInput(),
                rotated: .constant(false)
            )
            .previewDisplayName("Picker")
            GridView(
                userInput: UserInput(),
                rotated: .constant(true)
            )
            .previewDisplayName("Picker-rotated")
            GridView(
                userInput: UserInput(),
                rotated: .constant(false)
            )
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("Picker-dark")
        }
    }
}
