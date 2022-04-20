//
//  ShareButton.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct ShareButton: View {
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: "square.and.arrow.up")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 24, height: 24)
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(action: {})
    }
}
