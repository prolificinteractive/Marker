//
//  AppTheme.swift
//  Marker
//
//  Created by Htin Linn on 6/9/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Foundation

internal final class AppTheme {
    
    struct Constants {
        static let fontThemeDidChangeNotification = "FontThemeDidChange"
    }
    
    // MARK: - Properties

    var font: Font {
        didSet {
            fontTheme = MarkerExampleFontTheme(font: font)
            
            NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.fontThemeDidChangeNotification), object: nil)
        }
    }
    private(set) var fontTheme: FontTheme
    
    // MARK: - Init/Deinit
    
    init() {
        font = HelveticaNeueFont()
        fontTheme = MarkerExampleFontTheme(font: font)
    }
    
}
