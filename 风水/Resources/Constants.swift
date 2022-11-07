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
        static let spacing: CGFloat = 10.0

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
            static var width: CGFloat {
                switch UIDevice.current.userInterfaceIdiom {
                case .pad:
                    return min(UIScreen.screenWidth / 6, UIScreen.screenHeight / 6)
                default:
                    return min(UIScreen.screenWidth / 4, UIScreen.screenHeight / 4)
                }
            }
            static let inset: CGFloat = 12.0
            static let backgroundOpacity: CGFloat = 0.4
            static let cornerRadius: CGFloat = 16.0
            static let unknownText: String = "﹖"
            static let evilText: String = "三煞"
            static let evilTextIcon: String = "🔴"
            static let ageText: String = "太歲"
            static let ageTextIcon: String = "🔵"
        }
    }
}
