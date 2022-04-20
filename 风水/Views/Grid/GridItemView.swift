//
//  CalculatedGridItem.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct GridItemView: View {
    var baseNumber: String
    var locationNumber: String
    var directionNumber: String
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(locationNumber)
                Text(directionNumber)
            }
            Text(baseNumber)
        }
        .multilineTextAlignment(.center)
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
            .gray.opacity(
                Constants.GridItem.backgroundOpacity
            )
        )
        .cornerRadius(
            Constants.GridItem.cornerRadius
        )
    }
}

struct CalculatedGridItemView_Previews: PreviewProvider {
    static var previews: some View {
        GridItemView(
            baseNumber: "9".translatedToChinese(),
            locationNumber: "6",
            directionNumber: "4"
        )
    }
}
