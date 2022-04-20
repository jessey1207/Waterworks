//
//  GridView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct GridView: View {
    @ObservedObject var userInput: UserInput

    private let layout = Array(
        repeating: GridItem(.flexible()),
        count: 3
    )

    var body: some View {
        let viewModel = GridViewViewModel(userInput: userInput)
        LazyVGrid(columns: layout, spacing: 10) {
            ForEach(0..<9, id: \.self) { index in
                if !userInput.isInvalid {
                    GridItemView(
                        baseNumber: viewModel.baseNumber(at: index),
                        locationNumber: viewModel.locationNumber(at: index),
                        directionNumber: viewModel.directionNumber(at: index)
                    )
                } else {
                    GridItemView(
                        baseNumber: Constants.GridItem.unknownText,
                        locationNumber: Constants.GridItem.unknownText,
                        directionNumber: Constants.GridItem.unknownText
                    )
                }
            }
        }
        .padding(.horizontal)
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(userInput: UserInput())
        GridView(userInput: UserInput())
            .previewLayout(.fixed(width: 568, height: 320))
        GridView(userInput: UserInput())
            .preferredColorScheme(.dark)
        GridView(userInput: UserInput())
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
