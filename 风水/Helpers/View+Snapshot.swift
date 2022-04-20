//
//  View+Snapshot.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import SwiftUI

extension View {
    /// Returns a UIImage snapshot of the current screen.
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let targetSize = CGSize(
            width: UIScreen.main.bounds.width,
            height: controller.view.intrinsicContentSize.height
        )

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        controller.view.bounds = CGRect(origin: .zero, size: targetSize)

        return renderer.image { _ in
            controller.view.drawHierarchy(
                in: controller.view.bounds,
                afterScreenUpdates: true
            )
        }
    }
}
