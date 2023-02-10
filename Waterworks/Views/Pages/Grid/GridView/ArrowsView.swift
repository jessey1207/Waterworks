//
//  ArrowsView.swift
//  Waterworks
//
//  Created by Jessey Fung on 20/4/22.
//

import SwiftUI

struct ArrowsView: View {
    @ObservedObject var userInput: GridUserInput
    @Binding var rotated: Bool

    private let arrows: [Arrow] = [
        .topLeft, .top, .topRight,
        .left, .right,
        .bottomLeft, .bottom, .bottomRight
    ]

    var body: some View {
        let direction = userInput.direction
        VStack {
            HStack {
                arrows[0].makeViewFor(direction, rotated)
                Spacer()
                arrows[1].makeViewFor(direction, rotated)
                Spacer()
                arrows[2].makeViewFor(direction, rotated)
            }
            Spacer()
            HStack {
                arrows[3].makeViewFor(direction, rotated)
                Spacer()
                arrows[4].makeViewFor(direction, rotated)
            }
            Spacer()
            HStack {
                arrows[5].makeViewFor(direction, rotated)
                Spacer()
                arrows[6].makeViewFor(direction, rotated)
                Spacer()
                arrows[7].makeViewFor(direction, rotated)
                    
            }
        }
        .padding(10)
    }
}

private extension Arrow {
    @ViewBuilder
    func makeViewFor(_ direction: Direction, _ rotated: Bool) -> some View {
        let isVisible = rotated
        ? self.cardinalPoint == .S
        : self.cardinalPoint == direction.cardinalPoint

        switch self {
        case .topLeft:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.up, isVisible: isVisible)
                .rotationEffect(.degrees(-45), anchor: .topTrailing)
        case .top:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.up, isVisible: isVisible)
        case .topRight:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.up, isVisible: isVisible)
                .rotationEffect(.degrees(45), anchor: .topLeading)
        case .left:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.left, isVisible: isVisible)
        case .right:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.right, isVisible: isVisible)
        case .bottomLeft:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.down, isVisible: isVisible)
                .rotationEffect(.degrees(45), anchor: .bottomTrailing)
        case .bottom:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.down, isVisible: isVisible)
        case .bottomRight:
            makeArrowImage(name: Constants.Grid.Arrows.ImageNames.down, isVisible: isVisible)
                .rotationEffect(.degrees(-45), anchor: .bottomLeading)
        }
    }
    
    func makeArrowImage(name: String, isVisible: Bool) -> some View {
        Image(systemName: name)
            .foregroundColor(.brownPrimary)
            .font(.system(size: Constants.Grid.Arrows.size))
            .opacity(isVisible ? 1 : 0)
    }
}

struct ArrowsView_Previews: PreviewProvider {
    static var previews: some View {
        let input = GridUserInput()
        input.luck = .eight
        input.location = .子

        return ArrowsView(userInput: input, rotated: .constant(false))
    }
}
