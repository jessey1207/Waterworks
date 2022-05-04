//
//  ContentView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userInput = UserInput()
    @State var rotated: Bool = false

    var body: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 40) {
                Spacer()
                PickerView(userInput: userInput)
                GridView(userInput: userInput, rotated: $rotated)
                RotateButton(userInput: userInput, rotated: $rotated)
                Spacer()
            }
            .scrollInLandscapeMode()
            .ignoresSafeArea(.keyboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}
