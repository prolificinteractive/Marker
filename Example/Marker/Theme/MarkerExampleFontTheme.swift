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
    
    var labelTextStyle: MarkerExampleTextStyle {
        let font = fonts.headlineFont
        let emFont = fonts.headlineFontItalic
        let strongFont = fonts.headlineFontBold
        let chacterSpacing: CGFloat = 2
        
        return MarkerExampleTextStyle(font: font,
                                      emFont: emFont,
                                      strongFont: strongFont,
                                      characterSpacing: chacterSpacing)
    }
    
    var textFieldTextStyle: MarkerExampleTextStyle {
        let font = fonts.headlineFont
        let chacterSpacing: CGFloat = 5
        
        return MarkerExampleTextStyle(font: font, characterSpacing: chacterSpacing)
    }

    var textViewTextStyle: MarkerExampleTextStyle {
        var textViewTextStyle = labelTextStyle
        textViewTextStyle.lineSpacing = 3
        
        return textViewTextStyle
    }
    
}
