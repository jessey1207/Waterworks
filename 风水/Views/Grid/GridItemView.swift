//
//  CalculatedGridItem.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct GridItemView: View {
    let baseNumber: String
    let locationNumber: String
    let directionNumber: String
    let cardinalCharacter: String
    
    var body: some View {
        VStack {
            VStack(spacing: 10) {
                HStack {
                    Text(locationNumber)
                    Text(directionNumber)
                }
                Text(baseNumber)
            }
            .multilineTextAlignment(.center)
            
            HStack {
                Spacer()
                Text(cardinalCharacter)
                    .font(.system(size: 12))
                    .foregroundColor(.red)
            }
            .padding(.horizontal, Constants.GridItem.inset)
        }
        .padding(
            EdgeInsets(
                top: Constants.GridItem.inset,
                leading: Constants.GridItem.inset,
                bottom: Constants.GridItem.inset,
                trailing: Constants.GridItem.inset
            )
        )
        .frame(
            minWidth: Constants.GridItem.minWidth,
            maxWidth: Constants.GridItem.maxWidth,
            minHeight: Constants.GridItem.minHeight
        )
        .background(
            .gray.opacity(Constants.GridItem.backgroundOpacity)
        )
        .cornerRadius(Constants.GridItem.cornerRadius)
    }
}

struct CalculatedGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(
            baseNumber: "9".translatedToChinese(),
            locationNumber: "6",
            directionNumber: "4",
            cardinalCharacter: "巽"
        )
    }
}
