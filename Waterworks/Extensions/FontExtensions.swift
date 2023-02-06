//
//  FontExtensions.swift
//  Waterworks
//
//  Created by Jessey Fung on 4/2/2023.
//

import SwiftUI

private let isPad = UIDevice.current.userInterfaceIdiom == .pad

extension Font {
    static let titlePrimary = system(size: isPad ? 32 : 24, weight: .regular)
    
    static let bodyPrimaryHeavy = system(size: isPad ? 24 : 17, weight: .heavy)
    
    static let bodySecondary = system(size: isPad ? 24 : 14, weight: .regular)
    static let bodySecondaryBold = system(size: isPad ? 20 : 14, weight: .bold)
    
    static let captionRegular = system(size: isPad ? 16 : 12, weight: .regular)
    static let control = system(size: isPad ? 14 : 11, weight: .regular)
}
