//
//  BackgroundView.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(
            colors: [
                .brown.opacity(0.5),
                .brown.opacity(0.4),
                .brown.opacity(0.3),
                .brown.opacity(0.4),
                .brown.opacity(0.5),
                .brown.opacity(0.4),
                .brown.opacity(0.3),
                .brown.opacity(0.4),
                .brown.opacity(0.5)
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
