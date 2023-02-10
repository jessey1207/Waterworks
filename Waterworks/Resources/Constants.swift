//
//  Constants.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import UIKit

private let isPad = UIDevice.current.userInterfaceIdiom == .pad

enum Constants {
    
    enum Buttons {
        static let add: String = "兼"
        static let doNotAdd: String = "不兼"
    }

    enum Icons {
        static let size: CGFloat = 28.0

        enum ImageNames {
            static let location = "location.north.circle"
            static let undo = "arrow.uturn.backward"
        }
    }
    
    enum Compass {
        static let imageName: String = "Compass"
        static let size: CGFloat = isPad ? 100.0 : 65.0
    }

    enum ChinesePicker {
        static let luckText: String = "運"
        static let locationText: String = "坐"
        static let directionText: String = "向"
        static let yearText: String = "年"
    }

    enum Grid {
        static let spacing: CGFloat = 10.0
        static let padding: CGFloat = isPad ? 40.0 : 30.0

        enum Arrows {
            static let size: CGFloat = isPad ? 25.0 : 15.0

            enum ImageNames {
                static let up = "arrowtriangle.up.fill"
                static let left = "arrowtriangle.left.fill"
                static let right = "arrowtriangle.right.fill"
                static let down = "arrowtriangle.down.fill"
            }
        }

        enum Item {
            static let size = isPad
            ? min(UIScreen.screenWidth / 5, UIScreen.screenHeight / 5)
            : min(UIScreen.screenWidth / 4, UIScreen.screenHeight / 4)
            static let inset: CGFloat = 6.0
            static let backgroundOpacity: CGFloat = 0.8
            static let cornerRadius: CGFloat = 16.0
            static let unknownText: String = "﹖"
            static let yearText: String = "年"
            static let evilText: String = "三煞"
            static let evilTextIcon: String = "🟠"
            static let ageText: String = "太歲"
            static let ageTextIcon: String = "🟢"
            static let strengthText: String = "力"
            static let strengthIcon: String = "🔵"
        }
    }
    
    enum HamburgerMenu {
        enum Button {
            static let size: CGFloat = isPad ? 32.0 : 26.0
            static let padding: CGFloat = isPad ? 14.0 : 10.0
            static let inactiveImageName: String = "line.horizontal.3"
            static let activeImageName: String = "arrow.left"
        }
        
        enum ItemButton {
            static let size: CGFloat = 55.0
            static let cornerRadius: CGFloat = 12.0
        }
    }
}
