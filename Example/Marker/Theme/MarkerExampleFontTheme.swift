//
//  MarkerExampleFontTheme.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal struct MarkerExampleFontTheme: FontTheme {
    
    // MARK: - Properties
    
    let fonts: Fonts
    
    // MARK: - Protocol conformance
    
    // MARK: FontTheme
    
    var coverTextStyle: MarkerExampleTextStyle {
        let font = fonts.headlineFont
        let emFont = fonts.headlineFontItalic
        let strongFont = fonts.headlineFontBold
        let characterSpacing: CGFloat = 2
        
        return MarkerExampleTextStyle(font: font,
                                      emFont: emFont,
                                      strongFont: strongFont,
                                      characterSpacing: characterSpacing)
    }
    
    var bodyTextStyle: MarkerExampleTextStyle {
        let font = fonts.headlineFontBold
        
        return MarkerExampleTextStyle(font: font)
    }

    var captionTextStyle: MarkerExampleTextStyle {
        var captionTextStyle = coverTextStyle
        captionTextStyle.characterSpacing = 0
        captionTextStyle.paragraphSpacing = -3
        
        return captionTextStyle
    }
    
}
