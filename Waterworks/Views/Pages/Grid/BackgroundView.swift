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
                .bronze.opacity(0.4),
                .bronze.opacity(0.5),
                .bronze.opacity(0.5),
                .bronze.opacity(0.6),
                .bronze.opacity(0.6),
                .bronze.opacity(0.6),
                .bronze.opacity(0.5),
                .bronze.opacity(0.5),
                .bronze.opacity(0.4)
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
