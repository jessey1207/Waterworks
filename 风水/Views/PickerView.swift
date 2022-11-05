//
//  PickerView.swift
//  风水
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct PickerView: View {
    @ObservedObject var userInput: UserInput

    let selectedTab: Tab
    
    var body: some View {
        switch selectedTab {
        case .directionPickerGrid:
            HStack(spacing: 50) {
                luckPicker
                locationPicker
                directionText
            }
        case .yearPickerGrid:
            HStack(spacing: 20) {
                yearPicker
                heavenEarthText
            }
        }
    }

    // MARK: - DirectionPickerGrid

    private var luckPicker: some View {
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

    private var locationPicker: some View {
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

    private var directionText: some View {
        HStack {
            Text(Constants.ChinesePicker.directionText)
                .font(.title)
            Text(userInput.direction.rawValue)
                .font(.title)
                .foregroundColor(.gray)
        }
    }

    // MARK: - YearPickerGrid

    private var yearPicker: some View {
        HStack {
            Menu {
                Picker(selection: $userInput.year.number) {
                    ForEach(getYearRange(), id: \.self) {
                        Text(String($0))
                    }
                } label: {}
            } label: {
                Text(String(userInput.year.number))
                    .font(.title)
                    .frame(minWidth: 70)
            }
            Text(Constants.ChinesePicker.yearText)
                .font(.title)
        }
    }

    private var heavenEarthText: some View {
        HStack(spacing: 0) {
            Text(userInput.year.heavenStem.rawValue)
            Text(userInput.year.earthBranch.rawValue)
        }
        .font(.title)
        .foregroundColor(.gray)
    }

    // MARK: Helper
    
    private func getYearRange() -> ClosedRange<Int> {
        let currentDate = Date()
    
        var dateComponents = DateComponents()
        dateComponents.year = 200
        let futureDate = Calendar.current.date(byAdding: dateComponents, to: currentDate) ?? currentDate

        let currentYear = Calendar.current.component(.year, from: currentDate)
        let futureYear = Calendar.current.component(.year, from: futureDate)
        return currentYear ... futureYear
    }
}

struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView(userInput: UserInput(), selectedTab: .directionPickerGrid)
        PickerView(userInput: UserInput(), selectedTab: .yearPickerGrid)
    }
}
