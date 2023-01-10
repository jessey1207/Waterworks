//
//  ContentView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userInput: UserInput = .init()
    @State private var rotated: Bool = false
    
    var body: some View {
        ZStack(alignment: .center) {
            BackgroundView()
            VStack(spacing: 25) {
                PickerView(userInput: userInput)
                GridView(
                    userInput: userInput,
                    rotated: $rotated
                )
                RotateButton(
                    userInput: userInput,
                    rotated: $rotated
                )
                .disabled(userInput.isInvalid)
                HStack(spacing: 25) {
                    Text("\(Constants.Grid.Item.evilTextIcon) \(Constants.Grid.Item.evilText)")
                    Text("\(Constants.Grid.Item.ageTextIcon) \(Constants.Grid.Item.ageText)")
                }
                .font(.callout)
            }
            .scrollInLandscapeMode()
            Image("Compass")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .background(Color.white.opacity(0.5))
                .padding(.leading, 10)
                .padding(.bottom, 10)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("Grid-light")
        ContentView()
            .preferredColorScheme(.dark)
            .previewDisplayName("Grid-dark")
    }
}
