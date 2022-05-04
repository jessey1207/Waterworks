//
//  GridView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var userInput: UserInput
    @Binding var rotated: Bool

    private let layout = Array(
        repeating: GridItem(.flexible()),
        count: 3
    )

    var body: some View {
        let viewModel = GridViewModel(
            userInput: userInput,
            rotated: rotated
        )
        LazyVGrid(columns: layout, spacing: 10) {
            ForEach(0..<9, id: \.self) { index in
                if !userInput.isInvalid {
                    GridItemView(
                        baseNumber: viewModel.baseNumber(at: index),
                        locationNumber: viewModel.locationNumber(at: index),
                        directionNumber: viewModel.directionNumber(at: index),
                        cardinalCharacter: viewModel.cardinalCharacter(at: index)
                    )
                } else {
                    GridItemView(
                        baseNumber: Constants.Grid.Item.unknownText,
                        locationNumber: Constants.Grid.Item.unknownText,
                        directionNumber: Constants.Grid.Item.unknownText,
                        cardinalCharacter: Constants.Grid.Item.unknownText
                    )
                }
            }
        }
        .padding(30)
        .overlay(
            ArrowsView(
                userInput: userInput,
                rotated: $rotated
            )
        )
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(userInput: UserInput(), rotated: .constant(false))
        GridView(userInput: UserInput(), rotated: .constant(false))
            .previewLayout(.fixed(width: 568, height: 320))
        GridView(userInput: UserInput(), rotated: .constant(false))
            .preferredColorScheme(.dark)
        GridView(userInput: UserInput(), rotated: .constant(false))
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
