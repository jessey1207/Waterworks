//
//  CalculatedGridItem.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct GridItemView: View {
    let baseNumber: String
    let locationNumber: String
    let directionNumber: String
    let cardinalCharacter: String
    
    let yearNumber: String
    let isVisibleEvilIcon: Bool
    let isVisibleAgeIcon: Bool
    let isVisibleStrengthIcon: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            centerNumbersView
                .padding(.top, 7)
            bottomView
        }
        .padding(Constants.Grid.Item.inset)
        .background(
            .gray.opacity(Constants.Grid.Item.backgroundOpacity)
        )
        .cornerRadius(Constants.Grid.Item.cornerRadius)
    }

    private var centerNumbersView: some View {
        VStack(spacing: 10) {
            HStack {
                Text(locationNumber)
                Text(directionNumber)
            }
            Text(baseNumber)
        }
        .multilineTextAlignment(.center)
    }
    
    private var bottomView: some View {
        HStack(spacing: 5) {
            Text(yearNumber)
            if isVisibleEvilIcon {
                Text(Constants.Grid.Item.evilTextIcon)
            }
            if isVisibleAgeIcon {
                Text(Constants.Grid.Item.ageTextIcon)
            }
            if isVisibleStrengthIcon {
                Text(Constants.Grid.Item.strengthIcon)
            }
            Spacer()
            Text(cardinalCharacter)
                .foregroundColor(.red)
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
            yearNumber: "6",
            isVisibleEvilIcon: true,
            isVisibleAgeIcon: true,
            isVisibleStrengthIcon: true
        )
        .frame(width: 120, height: 120)
        .previewDisplayName("GridItem")
    }
}
