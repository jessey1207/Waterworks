//
//  ContentView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private var userInput: UserInput
    @State private var selectedTab: Tab
    @State private var rotated: Bool = false

    init(
        userInput: UserInput = .init(),
        selectedTab: Tab = .directionPickerGrid
    ) {
        self.userInput = userInput
        self.selectedTab = selectedTab
        UITabBar.appearance().backgroundColor = UIColor.white
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20)],
            for: .normal
        )
    }
    
    var body: some View {
        tabView
    }

    private var tabView: some View {
        TabView(selection: $selectedTab) {
            directionPickerTab
                .tabItem {
                    Text(Tab.directionPickerGrid.tabTitle)
                }
                .tag(Tab.directionPickerGrid)
            yearPickerTab
                .tabItem {
                    Text(Tab.yearPickerGrid.tabTitle)
                }
                .tag(Tab.yearPickerGrid)
        }
    }
    
    private var directionPickerTab: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 40) {
                Color.clear
                    .frame(height: 15)
                PickerView(
                    userInput: userInput,
                    selectedTab: .directionPickerGrid
                )
                GridView(
                    userInput: userInput,
                    rotated: $rotated,
                    selectedTab: .directionPickerGrid
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
    
    private var yearPickerTab: some View {
        ZStack {
            BackgroundView()
            VStack(spacing: 40) {
                Color.clear
                    .frame(height: 15)
                PickerView(
                    userInput: userInput,
                    selectedTab: .yearPickerGrid
                )
                GridView(
                    userInput: userInput,
                    rotated: $rotated,
                    selectedTab: .yearPickerGrid
                )
                HStack(spacing: 55) {
                    Text("\(Constants.Grid.Item.evilTextIcon) \(Constants.Grid.Item.evilText)")
                    Text("\(Constants.Grid.Item.ageTextIcon) \(Constants.Grid.Item.ageText)")
                }
                .font(.callout)
            }
            .scrollInLandscapeMode()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(selectedTab: .directionPickerGrid)
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("DirectionPickerGrid")
        ContentView(selectedTab: .directionPickerGrid)
            .preferredColorScheme(.dark)
            .previewDisplayName("DirectionPickerGrid-dark")
        ContentView(selectedTab: .yearPickerGrid)
            .previewLayout(.fixed(width: 568, height: 320))
            .previewDisplayName("YearPickerGrid")
        ContentView(selectedTab: .yearPickerGrid)
            .preferredColorScheme(.dark)
            .previewDisplayName("YearPickerGrid-dark")
    }
}
