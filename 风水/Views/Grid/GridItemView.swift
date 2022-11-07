//
//  CalculatedGridItem.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct GridItemView: View {
    let baseNumber: String
    let locationNumber: String?
    let directionNumber: String?
    let cardinalCharacter: String?
    let isVisibleEvilText: Bool
    let isVisibleAgeText: Bool
    
    var body: some View {
        ZStack {
            centerNumbersView
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .center
                )
            bottomTrailingView
                .frame(
                    maxWidth: .infinity,
                    maxHeight: .infinity,
                    alignment: .bottomTrailing
                )
        }
        .aspectRatio(1.0, contentMode: .fit)
        .padding(Constants.Grid.Item.inset)
        .background(
            .gray.opacity(Constants.Grid.Item.backgroundOpacity)
        )
        .cornerRadius(Constants.Grid.Item.cornerRadius)
    }

    private var centerNumbersView: some View {
        VStack(spacing: 10) {
            HStack {
                if let locationNumber = locationNumber,
                   let directionNumber = directionNumber {
                    Text(locationNumber)
                    Text(directionNumber)
                }
            }
            Text(baseNumber)
        }
        .multilineTextAlignment(.center)
    }

    private var bottomTrailingView: some View {
        HStack(spacing: 0) {
            Spacer()
            if let cardinalCharacter = cardinalCharacter {
                Text(cardinalCharacter)
                    .foregroundColor(.red)
            } else {
                if isVisibleEvilText {
                    Text(Constants.Grid.Item.evilTextIcon)
                }
                if isVisibleAgeText {
                    Text(Constants.Grid.Item.ageTextIcon)
                }
            }
        }
        .font(.caption)
    }
}

struct CalculatedGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(
            baseNumber: "9".translatedToChinese(),
            locationNumber: "6",
            directionNumber: "4",
            cardinalCharacter: "巽",
            isVisibleEvilText: false,
            isVisibleAgeText: false
        )
        .previewDisplayName("DirectionPickerGridItem")
        GridItemView(
            baseNumber: "9".translatedToChinese(),
            locationNumber: nil,
            directionNumber: nil,
            cardinalCharacter: nil,
            isVisibleEvilText: true,
            isVisibleAgeText: true
        )
        .previewDisplayName("YearPickerGridItem")
    }
}
