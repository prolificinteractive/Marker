//
//  ThemeFactory.swift
//  Marker
//
//  Created by Htin Linn on 5/25/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal struct ThemeFactory {
    
    // MARK: - Properties
    
    let fontTheme: FontTheme
    
    // MARK: - Private properties
    
    private let fonts: Fonts
    
    // MARK: - Init/Deinit
    
    init() {
        fonts = HelveticaFonts()
        fontTheme = MarkerExampleFontTheme(fonts: fonts)
    }
    
}