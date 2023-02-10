//
//  RotateGridButton.swift
//  Waterworks
//
//  Created by Jessey Fung on 21/4/22.
//

import SwiftUI

struct RotateButton: View {
    @ObservedObject var userInput: GridUserInput
    @Binding var rotated: Bool

    private var isDisabled: Bool {
        userInput.direction.cardinalPoint == .S
    }

    var body: some View {
        Button(
            action: { rotated.toggle() }
        ) {
            switch (isDisabled, rotated) {
            case (false, true):
                Image(systemName: Constants.Icons.ImageNames.undo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.Icons.size, height: Constants.Icons.size)
            default:
                Image(systemName: Constants.Icons.ImageNames.location)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: Constants.Icons.size, height: Constants.Icons.size)
            }
        }
        .disabled(isDisabled)
        .onReceive(userInput.$luck) { _ in
            rotated = false // Need to reset once user input changes
        }
        .onReceive(userInput.$location) { _ in
            rotated = false // Need to reset once user input changes
        }
    }
}

struct RotateButton_Previews: PreviewProvider {
    static var previews: some View {
        RotateButton(userInput: GridUserInput(), rotated: .constant(false))
    }
}

