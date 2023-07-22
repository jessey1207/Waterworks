//
//  PickerView.swift
//  Waterworks
//
//  Created by Jessey Fung on 17/4/22.
//

import SwiftUI

struct PickerView: View {
    @ObservedObject var userInput: GridUserInput
    
    var body: some View {
        VStack(spacing: 0) {
            directionPickers
            yearPickers
        }
    }
    
    private var directionPickers: some View {
        HStack(spacing: 0) {
            luckPicker
                .padding(.trailing, 30)
            locationPicker
                .padding(.trailing, 30 - 12)
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
        HStack(spacing: 0) {
            Menu {
                Picker(selection: $userInput.luck) {
                    ForEach(Luck.allCases) {
                        Text(String($0.rawValue))
                    }
                } label: {}
            } label: {
                Text(String(userInput.luck.rawValue))
                    .font(.custom(.title))
                    .padding(12)
            }
            Text(Constants.ChinesePicker.luckText)
                .font(.custom(.title))
                .foregroundColor(.custom(.brownPrimary))
        }
    }

    private var locationPicker: some View {
        HStack(spacing: 0) {
            Text(Constants.ChinesePicker.locationText)
                .font(.custom(.title))
                .foregroundColor(.custom(.brownPrimary))
            Menu {
                Picker(selection: $userInput.location) {
                    ForEach(Location.allCases) {
                        Text(String($0.rawValue))
                    }
                } label: {}
            } label: {
                Text(String(userInput.location.rawValue))
                    .font(.custom(.title))
                    .padding(12)
            }
        }
    }

    private var directionText: some View {
        HStack(spacing: 0) {
            Text(Constants.ChinesePicker.directionText)
                .font(.custom(.title))
                .foregroundColor(.custom(.brownPrimary))
            Text(userInput.direction.rawValue)
                .font(.custom(.title))
                .foregroundColor(.gray)
                .padding(12)
        }
    }

    // MARK: - Year pickers

    private var yearPicker: some View {
        HStack(spacing: 0) {
            Menu {
                Picker(selection: $userInput.year.number) {
                    ForEach(getYearRange(), id: \.self) {
                        Text(String($0))
                    }
                } label: {}
            } label: {
                Text(String(userInput.year.number))
                    .font(.custom(.title))
                    .frame(minWidth: 45)
                    .padding(12)
            }
            Text(Constants.ChinesePicker.yearText)
                .font(.custom(.title))
                .foregroundColor(.custom(.brownPrimary))
        }
    }

    private var heavenEarthText: some View {
        HStack(spacing: 0) {
            Text(userInput.year.heavenStem.rawValue)
            Text(userInput.year.earthBranch.rawValue)
        }
        .font(.custom(.title))
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
