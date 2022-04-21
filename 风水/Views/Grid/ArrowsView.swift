//
//  ArrowsView.swift
//  风水
//
//  Created by Jessey Fung on 20/4/22.
//

import SwiftUI

struct ArrowsView: View {
    @ObservedObject var userInput: UserInput

    private let arrows: [Arrow] = [
        .topLeft, .top, .topRight,
        .left, .right,
        .bottomLeft, .bottom, .bottomRight
    ]

    var body: some View {
        let direction = userInput.direction
        VStack {
            HStack {
                arrows[0].makeViewFor(direction: direction)
                Spacer()
                arrows[1].makeViewFor(direction: direction)
                Spacer()
                arrows[2].makeViewFor(direction: direction)
            }
            Spacer()
            HStack {
                arrows[3].makeViewFor(direction: direction)
                Spacer()
                arrows[4].makeViewFor(direction: direction)
            }
            Spacer()
            HStack {
                arrows[5].makeViewFor(direction: direction)
                Spacer()
                arrows[6].makeViewFor(direction: direction)
                Spacer()
                arrows[7].makeViewFor(direction: direction)
                    
            }
        }
        .padding(10)
    }
}

private extension Arrow {
    @ViewBuilder
    func makeViewFor(direction: Direction) -> some View {
        let isHidden = self.cardinalPoint != direction.cardinalPoint

        switch self {
        case .topLeft:
            Image(systemName: Constants.Grid.Arrows.ImageNames.up)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(-45), anchor: .topTrailing)
                .opacity(isHidden ? 0 : 1)
        case .top:
            Image(systemName: Constants.Grid.Arrows.ImageNames.up)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isHidden ? 0 : 1)
        case .topRight:
            Image(systemName: Constants.Grid.Arrows.ImageNames.up)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(45), anchor: .topLeading)
                .opacity(isHidden ? 0 : 1)
        case .left:
            Image(systemName: Constants.Grid.Arrows.ImageNames.left)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isHidden ? 0 : 1)
        case .right:
            Image(systemName: Constants.Grid.Arrows.ImageNames.right)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isHidden ? 0 : 1)
        case .bottomLeft:
            Image(systemName: Constants.Grid.Arrows.ImageNames.down)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(45), anchor: .bottomTrailing)
                .opacity(isHidden ? 0 : 1)
        case .bottom:
            Image(systemName: Constants.Grid.Arrows.ImageNames.down)
                .font(.system(size: Constants.Grid.Arrows.size))
                .opacity(isHidden ? 0 : 1)
        case .bottomRight:
            Image(systemName: Constants.Grid.Arrows.ImageNames.down)
                .font(.system(size: Constants.Grid.Arrows.size))
                .rotationEffect(.degrees(-45), anchor: .bottomLeading)
                .opacity(isHidden ? 0 : 1)
        }
    }
}

struct ArrowsView_Previews: PreviewProvider {
    static var previews: some View {
        let input = UserInput()
        input.luck = .eight
        input.location = .子

        return ArrowsView(userInput: input)
    }
}
