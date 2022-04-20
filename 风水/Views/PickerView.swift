//
//  PickerView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct PickerView: View {
    @ObservedObject var userInput: UserInput
    
    var body: some View {
        HStack(spacing: 50) {
            LuckText(userInput: userInput)
            LocationText(userInput: userInput)
            DirectionText(userInput: userInput)
        }
    }
}

private struct LuckText: View {
    @ObservedObject var userInput: UserInput
    
    var body: some View {
        HStack {
            Menu {
                Picker(selection: $userInput.luck) {
                    ForEach(Luck.allCases) {
                        Text(String($0.rawValue))
                    }
                } label: {}
            } label: {
                Text(String(userInput.luck.rawValue))
                    .font(.title)
            }
            Text(Constants.ChinesePicker.luckText)
                .font(.title)
        }
    }
}

private struct LocationText: View {
    @ObservedObject var userInput: UserInput
    
    var body: some View {
        HStack {
            Text(Constants.ChinesePicker.locationText)
                .font(.title)
            Menu {
                Picker(selection: $userInput.location) {
                    ForEach(Location.allCases) {
                        Text(String($0.rawValue))
                    }
                } label: {}
            } label: {
                Text(String(userInput.location.rawValue))
                    .font(.title)
            }
        }
    }
}

private struct DirectionText: View {
    @ObservedObject var userInput: UserInput
    
    var body: some View {
        HStack {
            Text(Constants.ChinesePicker.directionText)
                .font(.title)
            Text(userInput.direction.rawValue)
                .font(.title)
                .foregroundColor(.gray)
        }
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(userInput: UserInput())
    }
}
