//
//  PabloFonts.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal struct PabloFonts: Fonts {
    
    // MARK: - Protocol conformance
    
    // MARK: Fonts
    
    var headlineFont: UIFont {
        return .systemFontOfSize(headlineFontSize)
    }
    
    var headlineFontBold: UIFont {
        return .boldSystemFontOfSize(headlineFontSize)
    }
    
    var headlineFontItalic: UIFont {
        return .italicSystemFontOfSize(headlineFontSize)
    }
    
}
