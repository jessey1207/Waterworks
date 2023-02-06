//
//  PickerView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct PickerView: View {
    @ObservedObject var userInput: UserInput
    
    var body: some View {
        VStack(spacing: 16) {
            directionPickers
            yearPickers
        }
    }
    
    private var directionPickers: some View {
        HStack(spacing: 50) {
            luckPicker
            locationPicker
            directionText
        }
    }
    
    private var yearPickers: some View {
        HStack(spacing: 20) {
            yearPicker
            heavenEarthText
        }
    }

    // MARK: - Direction pickers

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
                    .font(.titlePrimary)
            }
            Text(Constants.ChinesePicker.luckText)
                .font(.titlePrimary)
                .foregroundColor(.brownPrimary)
        }
    }

    private var locationPicker: some View {
        HStack {
            Text(Constants.ChinesePicker.locationText)
                .font(.titlePrimary)
                .foregroundColor(.brownPrimary)
            Menu {
                Picker(selection: $userInput.location) {
                    ForEach(Location.allCases) {
                        Text(String($0.rawValue))
                    }
                } label: {}
            } label: {
                Text(String(userInput.location.rawValue))
                    .font(.titlePrimary)
            }
        }
    }

    private var directionText: some View {
        HStack {
            Text(Constants.ChinesePicker.directionText)
                .font(.titlePrimary)
                .foregroundColor(.brownPrimary)
            Text(userInput.direction.rawValue)
                .font(.titlePrimary)
                .foregroundColor(.gray)
        }
    }

    // MARK: - Year pickers

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
                    .font(.titlePrimary)
                    .frame(minWidth: 70)
            }
            Text(Constants.ChinesePicker.yearText)
                .font(.titlePrimary)
                .foregroundColor(.brownPrimary)
        }
    }

    private var heavenEarthText: some View {
        HStack(spacing: 0) {
            Text(userInput.year.heavenStem.rawValue)
            Text(userInput.year.earthBranch.rawValue)
        }
        .font(.titlePrimary)
        .foregroundColor(.gray)
    }

    // MARK: - Helpers
    
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
        PickerView(userInput: .init())
    }
}
