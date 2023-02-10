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
        ZStack {
            centerNumbersView
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                .padding(.bottom, 10)
            bottomView
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
        }
        .padding(Constants.Grid.Item.inset)
        .frame(width:  Constants.Grid.Item.size, height:  Constants.Grid.Item.size)
        .background(Color.gold.opacity(Constants.Grid.Item.backgroundOpacity))
        .cornerRadius(Constants.Grid.Item.cornerRadius)
    }

    private var centerNumbersView: some View {
        VStack(spacing: 10) {
            HStack {
                Text(locationNumber)
                Text(directionNumber)
            }
            .font(.bodySecondaryBold)
            .foregroundColor(.brownSecondary)
            Text(baseNumber)
                .font(.bodyPrimaryHeavy)
                .foregroundColor(.brownPrimary)
        }
        .multilineTextAlignment(.center)
    }
    
    private var bottomView: some View {
        HStack(spacing: 4) {
            Text(yearNumber)
            if isVisibleEvilIcon {
                Text(Constants.Grid.Item.evilTextIcon)
                    .font(.control)
            }
            if isVisibleAgeIcon {
                Text(Constants.Grid.Item.ageTextIcon)
                    .font(.control)
            }
            if isVisibleStrengthIcon {
                Text(Constants.Grid.Item.strengthIcon)
                    .font(.control)
            }
            Spacer()
            Text(cardinalCharacter)
                .foregroundColor(.darkRed)
        }
        .font(.captionRegular)
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
