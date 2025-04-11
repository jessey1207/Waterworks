//
//  ArrowsView.swift
//  Waterworks
//
//  Created by Jessey Fung on 20/4/22.
//

import SwiftUI

struct ArrowsView: View {
    @ObservedObject var userInput: GridUserInput
    @Binding var rotatedPoint: CardinalPoint

    private let arrows: [Arrow] = [
        .topLeft, .top, .topRight,
        .left, .right,
        .bottomLeft, .bottom, .bottomRight
    ]

    var body: some View {
        VStack {
            makeArrowSection(indices: 0..<3)
            Spacer()
            makeArrowSection(indices: 3..<5)
            Spacer()
            makeArrowSection(indices: 5..<8)
        }
        .padding(10)
    }
    
    private func makeArrowSection(indices: Range<Int>) -> some View {
        HStack {
            ForEach(indices, id: \.self) { index in
                arrows[index].makeViewFor(userInput.direction, rotatedPoint)
                    .onTapGesture {
                        rotatedPoint = arrows[index].cardinalPoint
                    }
                if index != indices.last {
                    Spacer()
                }
            }
        }
    }
}

private extension Arrow {
    @ViewBuilder
    func makeViewFor(_ direction: Direction, _ rotatedPoint: CardinalPoint) -> some View {
        let isVisible = self.cardinalPoint == rotatedPoint
        let isOriginalPoint = self.cardinalPoint == direction.cardinalPoint

        switch self {
        case .topLeft:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.up,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
            .rotationEffect(.degrees(-45), anchor: .topTrailing)
        case .top:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.up,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
        case .topRight:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.up,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
            .rotationEffect(.degrees(45), anchor: .topLeading)
        case .left:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.left,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
        case .right:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.right,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
        case .bottomLeft:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.down,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
            .rotationEffect(.degrees(45), anchor: .bottomTrailing)
        case .bottom:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.down,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
        case .bottomRight:
            makeArrowImage(
                name: Constants.Grid.Arrows.ImageNames.down,
                isVisible: isVisible,
                isOriginalPoint: isOriginalPoint
            )
            .rotationEffect(.degrees(-45), anchor: .bottomLeading)
        }
    }
    
    func makeArrowImage(
        name: String,
        isVisible: Bool,
        isOriginalPoint: Bool
    ) -> some View {
        Image(systemName: name)
            .foregroundColor(isOriginalPoint ? .purple : .custom(.brownPrimary))
            .frame(width: Constants.Grid.Arrows.size, height: Constants.Grid.Arrows.size)
            .opacity(isVisible ? 1 : 0.2)
    }
}

struct ArrowsView_Previews: PreviewProvider {
    static var previews: some View {
        let input = GridUserInput()
        input.luck = .eight
        input.location = .子

        return ArrowsView(userInput: input, rotatedPoint: .constant(.E))
    }
}
