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
            .padding(.horizontal, Constants.Grid.Item.inset)
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
