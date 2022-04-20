//
//  OrientationViewModifier.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

struct OrientationViewModifier: ViewModifier {
    @State private var isPortrait = false

    func body(content: Content) -> some View {
        content
            .onReceive(
                NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            ) { _ in
                guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
                self.isPortrait = scene.interfaceOrientation.isPortrait
            }
            .wrappedInScrollView(when: !isPortrait)
    }
}

extension View {
    @ViewBuilder
    func wrappedInScrollView(when condition: Bool) -> some View {
        if condition {
            ScrollView(.vertical, showsIndicators: false) {
                self
            }
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
