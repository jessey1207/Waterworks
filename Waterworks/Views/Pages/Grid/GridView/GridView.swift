//
//  GridView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct GridView: View {
    @ObservedObject private var viewModel: ViewModel
    @Binding var rotatedPoint: CardinalPoint

    init(
        userInput: GridUserInput,
        rotatedPoint: Binding<CardinalPoint>
    ) {
        viewModel = .init(
            userInput: userInput,
            rotatedPoint: rotatedPoint.wrappedValue
        )
        self._rotatedPoint = rotatedPoint
    }
    
    var body: some View {
        LazyVGrid(columns: layout, spacing: Constants.Grid.spacing) {
            ForEach(0..<9, id: \.self) { index in
                gridItem(index: index)
                    .onTapGesture {
                        rotatedPoint = viewModel.cardinalPoint(at: index)
                    }
            }
        }
        .frame(maxWidth: maxWidth)
        .padding(Constants.Grid.padding)
        .overlay(
            arrowsView
        )
        .animation(.easeInOut, value: viewModel.userInput.luck)
        .animation(.easeInOut, value: viewModel.userInput.location)
        .animation(.easeInOut, value: viewModel.userInput.year.number)
        .animation(.easeInOut, value: rotatedPoint)
    }

    private let layout = Array(
        repeating: GridItem(.fixed(Constants.Grid.Item.size), spacing: Constants.Grid.spacing),
        count: 3
    )

    private var maxWidth: CGFloat {
        let itemsWidth = Constants.Grid.Item.size * CGFloat(layout.count)
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
            rotatedPoint: $rotatedPoint
        )
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GridView(
                userInput: GridUserInput(),
                rotatedPoint: .constant(.E)
            )
            .previewDisplayName("Picker")
            GridView(
                userInput: GridUserInput(),
                rotatedPoint: .constant(.E)
            )
            .previewDisplayName("Picker-rotated")
            GridView(
                userInput: GridUserInput(),
                rotatedPoint: .constant(.E)
            )
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("Picker-dark")
        }
    }
}
