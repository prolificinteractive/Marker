//
//  ThemeFactory.swift
//  Marker
//
//  Created by Htin Linn on 5/25/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal struct ThemeFactory {
    
    // MARK: - Instance functions
    
    func fontTheme() -> FontTheme {
        return MarkerExampleFontTheme(fonts: fonts())
    }
    
    // MARK: - Private functions
    
    private func fonts() -> Fonts {
        return HelveticaFonts()
    }
    
}