//
//  Constants.swift
//  Waterworks
//
//  Created by Jessey Fung on 18/4/22.
//

import UIKit
import SwiftUI

private let isPad = UIDevice.current.userInterfaceIdiom == .pad

enum Constants {
    
    enum SearchLocation {
        static let findLocation: String = "Find a location"
        static let searchLocation: String = "Search location"
        static let useCurrentLocation: String = "Use current location"
        
        enum Map {
            static let annotationTitle: String = "Here"
            static let radius: Double = 1000
            static let confirmLocation: String = "Confirm Location"
        }
        
        enum ErrorAlert {
            static let title: String = "Something went wrong."
            static let okGotIt: String = "OK, got it."
            static let enableLocationServices: String = "You may need to enable location services to continue."
            static let noPlaces: String = "Could not find any places from your search."
            static let noPlace: String = "Failed to find the place for this location."
            static let tryAgain: String = "Please try again."
        }
    }
    
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
        static let size: CGFloat = isPad ? 140.0 : 90.0
        static let fontSize: CGFloat = isPad ? 14.0 : 11.0
        static let imageScale: Image.Scale = isPad ? .medium : .small
        static let leadingPadding = isPad ? 25.0 : 20.0 
        static let bottomPadding = isPad ? 10.0 : -5.0
        
        static let circleSize: CGFloat = isPad ? 30.0 : 15.0
        static let circleOffsetCorner: CGFloat = isPad ? 18.0 : 10.0
        static let textOffsetCorner: CGFloat = isPad ? 18.0 : 15.0
        static let circleOffsetAxis: CGFloat = isPad ? 23.0 : 14.0
        static let textOffsetAxis: CGFloat = isPad ? 24.0 : 18.0
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
            static let size: CGFloat = isPad ? 30 : 20.0

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
            static let backgroundOpacity: CGFloat = 0.2
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
    
    enum Delete {
        static let title: String = "Delete"
        
        enum Alert {
            static let title: String = "Warning"
            static let message: String = "This configuration will be deleted.\nAre you sure?"
            
            enum Buttons {
                static let yes: String = "Yes"
                static let no: String = "No"
            }
        }
    }
    
    enum Save {
        enum Modal {
            static let navigationTitle: String = "Save configuration"
            
            enum Fields {
                enum Name {
                    static let title: String = "Name"
                    static let imageName: String = "square.grid.3x3.fill"
                    static let placeholder: String = "Name this configuration"
                    static let emptyNameError: String = "Please add a name."
                    static let nameExistsError: String = "Name already exists. Please choose another name."
                }
                
                enum Notes {
                    static let title: String = "Notes"
                    static let imageName: String = "note.text"
                    static let placeholder: String = "Add some notes about it"
                }
                
                enum Location {
                    static let title: String = "Location"
                    static let imageName: String = "location.fill"
                    static let add: String = "Add location"
                    static let edit: String = "Edit"
                    static let remove: String = "Remove"
                }
            }
            static let edit: String = "Edit"
            static let done: String = "Done"
            static let save: String = "Save"
            static let cancel: String = "Cancel"
        }
        
        enum Alert {
            static let title: String = "Important"
            static let messagePrefix: String = "The following saved configurations\n will be deleted:\n\n"
            static let messageSuffix: String = "\nAre you sure?"
            static func listItem(name: String) -> String {
                "- \(name)\n"
            }
            
            enum Buttons {
                static let yes: String = "Yes"
                static let no: String = "No"
            }
        }
        
        enum Button {
            static let listNameSaved: String = "Saved"
            static let listNameOthers: String = "Others"
            static let size: CGFloat = isPad ? 28.0 : 24.0
            static let padding: CGFloat = isPad ? 14.0 : 10.0
            static let savedImageName: String = "suit.heart.fill"
            static let unsavedImageName: String = "suit.heart"
        }
        
        enum FavouriteButton {
            static let listName: String = "Favourites"
            static let size: CGFloat = isPad ? 28.0 : 24.0
            static let padding: CGFloat = isPad ? 14.0 : 10.0
            static let favouritedImageName: String = "star.fill"
            static let unfavouritedImageName: String = "star"
        }
    }
}
