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
    
    var headlineTextStyle: MarkerExampleTextStyle {
        let font = fonts.regularFont(headlineFontSize)
        let emFont = fonts.italicFont(headlineFontSize)
        let strongFont = fonts.boldFont(headlineFontSize)
        let characterSpacing: CGFloat = 2
        
        return MarkerExampleTextStyle(font: font,
                                      emFont: emFont,
                                      strongFont: strongFont,
                                      characterSpacing: characterSpacing)
    }
    
    var titleTextStyle: MarkerExampleTextStyle {
        return MarkerExampleTextStyle(font: fonts.boldFont(titleFontSize))
    }

    var bodyTextStyle: MarkerExampleTextStyle {
        var bodyTextStyle = headlineTextStyle
        bodyTextStyle.characterSpacing = 0
        bodyTextStyle.paragraphSpacing = -3
        
        return bodyTextStyle
    }
    
}
