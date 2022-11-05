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
        VStack {
            VStack(spacing: 10) {
                aboveBaseNumberView
                Text(baseNumber)
            }
            .multilineTextAlignment(.center)
            belowBaseNumberView
        }
        .padding(
            EdgeInsets(
                top: Constants.Grid.Item.inset,
                leading: Constants.Grid.Item.inset,
                bottom: Constants.Grid.Item.inset,
                trailing: Constants.Grid.Item.inset
            )
        )
        .frame(
            minWidth: Constants.Grid.Item.minWidth,
            maxWidth: Constants.Grid.Item.maxWidth,
            minHeight: Constants.Grid.Item.minHeight
        )
        .background(
            .gray.opacity(Constants.Grid.Item.backgroundOpacity)
        )
        .cornerRadius(Constants.Grid.Item.cornerRadius)
    }

    private var aboveBaseNumberView: some View {
        HStack {
            if let locationNumber = locationNumber,
               let directionNumber = directionNumber {
                Text(locationNumber)
                Text(directionNumber)
            } else {
                Spacer()
                Text(Constants.Grid.Item.evilText)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
                    .opacity(isVisibleEvilText ? 1 : 0)
            }
        }
        .padding(.horizontal, Constants.Grid.Item.inset)
    }

    private var belowBaseNumberView: some View {
        HStack {
            Spacer()
            if let cardinalCharacter = cardinalCharacter {
                Text(cardinalCharacter)
            } else {
                Text(Constants.Grid.Item.ageText)
                    .padding(.top, 0.5)
                    .opacity(isVisibleAgeText ? 1 : 0)
            }
        }
        .font(.system(size: 12))
        .foregroundColor(.red)
        .padding(.horizontal, Constants.Grid.Item.inset)
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
