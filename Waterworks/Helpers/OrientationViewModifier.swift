//
//  OrientationViewModifier.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct OrientationViewModifier: ViewModifier {
    @State private var isPortrait = false

    func body(content: Content) -> some View {
        content
            .onAppear {
                checkOrientation()
            }
            .onReceive(
                NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            ) { _ in
                checkOrientation()
            }
            .wrappedInScrollView(when: !isPortrait)
    }

    private func checkOrientation() {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        self.isPortrait = scene.interfaceOrientation.isPortrait
    }
}

extension View {
    @ViewBuilder
    func wrappedInScrollView(when condition: Bool) -> some View {
        if condition {
            ScrollView(.vertical, showsIndicators: false) {
                self
            }
            .padding(50)
        } else {
            self
        }
    }
}

extension View {
    func scrollInLandscapeMode() -> some View {
        modifier(OrientationViewModifier())
    }
}
