//
//  ArrowsView.swift
//  Waterworks
//
//  Created by Jessey Fung on 20/4/22.
//

import SwiftUI

struct ArrowsView: View {
    @ObservedObject var userInput: UserInput
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
            Image(systemName: Constants.Grid.Arrows.ImageNames.up)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(-45), anchor: .topTrailing)
                .opacity(isVisible ? 1 : 0)
        case .top:
            Image(systemName: Constants.Grid.Arrows.ImageNames.up)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isVisible ? 1 : 0)
        case .topRight:
            Image(systemName: Constants.Grid.Arrows.ImageNames.up)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(45), anchor: .topLeading)
                .opacity(isVisible ? 1 : 0)
        case .left:
            Image(systemName: Constants.Grid.Arrows.ImageNames.left)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isVisible ? 1 : 0)
        case .right:
            Image(systemName: Constants.Grid.Arrows.ImageNames.right)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isVisible ? 1 : 0)
        case .bottomLeft:
            Image(systemName: Constants.Grid.Arrows.ImageNames.down)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(45), anchor: .bottomTrailing)
                .opacity(isVisible ? 1 : 0)
        case .bottom:
            Image(systemName: Constants.Grid.Arrows.ImageNames.down)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isVisible ? 1 : 0)
        case .bottomRight:
            Image(systemName: Constants.Grid.Arrows.ImageNames.down)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(-45), anchor: .bottomLeading)
                .opacity(isVisible ? 1 : 0)
        }
    }
}

struct ArrowsView_Previews: PreviewProvider {
    static var previews: some View {
        let input = UserInput()
        input.luck = .eight
        input.location = .子

        return ArrowsView(userInput: input, rotated: .constant(false))
    }
}
