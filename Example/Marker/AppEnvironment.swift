//
//  AppEnvironment.swift
//  Marker
//
//  Created by Htin Linn on 6/9/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Foundation

internal final class AppEnvironment {
    
    struct Constants {
        static let FontThemeDidChangeNotification = "FontThemeDidChange"
    }
    
    // MARK: - Properties

    static private(set) var sharedEnvironment = AppEnvironment()

    var font: Font {
        didSet {
            themeFactory = ThemeFactory(font: font)
            
            NSNotificationCenter.defaultCenter().postNotificationName(Constants.FontThemeDidChangeNotification, object: nil)
        }
    }
    private(set) var themeFactory: ThemeFactory
    
    // MARK: - Init/Deinit
    
    init() {
        font = HelveticaNeueFont()
        themeFactory = ThemeFactory(font: font)
    }
    
}
