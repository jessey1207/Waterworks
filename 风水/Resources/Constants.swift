//
//  Constants.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import UIKit

enum Constants {
    enum ChinesePicker {
        static let luckText: String = "運"
        static let locationText: String = "坐"
        static let directionText: String = "向"
    }

    enum Grid {
        enum Arrows {
            static let size: CGFloat = 15.0

            enum ImageNames {
                static let up = "arrowtriangle.up.fill"
                static let left = "arrowtriangle.left.fill"
                static let right = "arrowtriangle.right.fill"
                static let down = "arrowtriangle.down.fill"
            }
        }
    }

    enum GridItem {
        static let inset: CGFloat = 6.0
        static let minWidth: CGFloat = 0.0
        static let maxWidth: CGFloat = .infinity
        static let minHeight: CGFloat = 90.0
        static let backgroundOpacity: CGFloat = 0.4
        static let cornerRadius: CGFloat = 16.0
        static let unknownText: String = "﹖"
    }
}
