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
            VStack(spacing: 40) {
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
            }
            .scrollInLandscapeMode()
        }
    }
    
    // TODO: Integrate this view into original one
//    private var yearPickerTab: some View {
//        ZStack(alignment: .center) {
//            BackgroundView()
//            VStack(spacing: 40) {
//                PickerView(
//                    userInput: userInput,
//                    selectedTab: .yearPickerGrid
//                )
//                GridView(
//                    userInput: userInput,
//                    rotated: $rotated,
//                    selectedTab: .yearPickerGrid
//                )
//                HStack(spacing: 55) {
//                    Text("\(Constants.Grid.Item.evilTextIcon) \(Constants.Grid.Item.evilText)")
//                    Text("\(Constants.Grid.Item.ageTextIcon) \(Constants.Grid.Item.ageText)")
//                }
//                .font(.callout)
//            }
//            .scrollInLandscapeMode()
//        }
//    }
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
