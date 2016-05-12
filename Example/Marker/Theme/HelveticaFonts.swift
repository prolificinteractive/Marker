//
//  HelveticaFonts.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal struct HelveticaFonts: Fonts {
    
    // MARK: - Protocol conformance
    
    // MARK: Fonts
    
    var headlineFont: UIFont {
        return UIFont(name: "HelveticaNeue", size: headlineFontSize)!
    }
    
    var headlineFontBold: UIFont {
        return UIFont(name: "HelveticaNeue-Bold", size: headlineFontSize)!
    }
    
    var headlineFontItalic: UIFont {
        return UIFont(name: "HelveticaNeue-Italic", size: headlineFontSize)!
    }
    
}
