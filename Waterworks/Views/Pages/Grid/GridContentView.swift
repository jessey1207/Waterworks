//
//  GridContentView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct GridContentView: View {
    @ObservedObject var userInput: GridUserInput
    @State private var rotated: Bool
    
    init(userInput: GridUserInput = .init(), rotated: Bool = false) {
        self.userInput = userInput
        self.rotated = rotated
    }
    
    var body: some View {
        ZStack(alignment: .center) {
            BackgroundView()
            VStack(spacing: 20) {
                PickerView(userInput: userInput)
                GridView(
                    userInput: userInput,
                    rotated: $rotated
                )
                actionButtons
                legendView
                    .padding(.top, 20)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .scrollInLandscapeMode()
            Image(Constants.Compass.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: Constants.Compass.size, height: Constants.Compass.size)
                .background(Color.white.opacity(0.5))
                .padding(.leading, 10)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
    
    private var actionButtons: some View {
        HStack(spacing: 40) {
            RotateButton(
                userInput: userInput,
                rotated: $rotated
            )
            Button(action: {
                userInput.isAdding.toggle()
            }) {
                Text(userInput.isAdding ? Constants.Buttons.doNotAdd : Constants.Buttons.add)
                    .font(.title)
            }
        }
        .disabled(userInput.isInvalid)
        .animation(.linear(duration: 0.2), value: userInput.isAdding)
    }
    
    private var legendView: some View {
        HStack(spacing: 25) {
            Text(Constants.Grid.Item.yearText)
                .foregroundColor(.black)
            legendItem(icon: Constants.Grid.Item.evilTextIcon, text: Constants.Grid.Item.evilText)
            legendItem(icon: Constants.Grid.Item.ageTextIcon, text: Constants.Grid.Item.ageText)
            legendItem(icon: Constants.Grid.Item.strengthIcon, text: Constants.Grid.Item.strengthText)
        }
        .font(.bodySecondary)
        .foregroundColor(.brownPrimary)
    }
    
    private func legendItem(icon: String, text: String) -> some View {
        HStack(spacing: 4) {
            Text(icon)
                .font(.control)
            Text(text)
        }
    }
}

struct GridContentView_Previews: PreviewProvider {
    static var previews: some View {
        GridContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("Grid-light")
        GridContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Grid-dark")
    }
}
