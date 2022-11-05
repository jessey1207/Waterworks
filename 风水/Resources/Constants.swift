//
//  Constants.swift
//  风水
//
//  Created by Jessey Fung on 18/4/22.
//

import UIKit

enum Constants {
    enum Tab {
        static let directionPickerGrid = "坐向"
        static let yearPickerGrid = "三煞太歲"
    }

    enum Icons {
        static let size: CGFloat = 25.0

        enum ImageNames {
            static let location = "location.north.circle"
            static let undo = "arrow.uturn.backward"
        }
    }

    enum ChinesePicker {
        static let luckText: String = "運"
        static let locationText: String = "坐"
        static let directionText: String = "向"
        static let yearText: String = "年"
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

        enum Item {
            static let inset: CGFloat = 6.0
            static let minWidth: CGFloat = 0.0
            static let maxWidth: CGFloat = .infinity
            static let minHeight: CGFloat = 90.0
            static let backgroundOpacity: CGFloat = 0.4
            static let cornerRadius: CGFloat = 16.0
            static let unknownText: String = "﹖"
            static let evilText: String = "三煞"
            static let ageText: String = "太歲"
        }
    }
}
