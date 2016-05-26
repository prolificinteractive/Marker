//
//  MarkerExampleFontTheme.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit
import Marker

internal struct MarkerExampleFontTheme: FontTheme {
    
    // MARK: - Properties
    
    let fonts: Fonts
    
    // MARK: - Protocol conformance
    
    // MARK: FontTheme
    
    var headlineTextStyle: TextStyle {
        let font = fonts.regularFont(headlineFontSize)
        let emFont = fonts.italicFont(headlineFontSize)
        let strongFont = fonts.boldFont(headlineFontSize)
        let characterSpacing: CGFloat = 2
        
        return TextStyle(font: font,
                         emFont: emFont,
                         strongFont: strongFont,
                         characterSpacing: characterSpacing)
    }
    
    var titleTextStyle: TextStyle {
        return TextStyle(font: fonts.boldFont(titleFontSize))
    }

    var bodyTextStyle: TextStyle {
        var bodyTextStyle = headlineTextStyle
        bodyTextStyle.characterSpacing = 0
        bodyTextStyle.paragraphSpacing = -3
        
        return bodyTextStyle
    }
    
}
