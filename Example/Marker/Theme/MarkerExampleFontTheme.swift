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
    
    let font: Font
    
    // MARK: - Protocol conformance
    
    // MARK: FontTheme
    
    var headlineTextStyle: TextStyle {
        let regularFont = font.regularFont(headlineFontSize)
        let emFont = font.italicFont(headlineFontSize)
        let strongFont = font.boldFont(headlineFontSize)
        let characterSpacing: CGFloat = 2
        
        return TextStyle(font: regularFont,
                         emFont: emFont,
                         strongFont: strongFont,
                         characterSpacing: characterSpacing)
    }
    
    var titleTextStyle: TextStyle {
        return TextStyle(font: font.boldFont(titleFontSize))
    }

    var bodyTextStyle: TextStyle {
        var bodyTextStyle = headlineTextStyle
        bodyTextStyle.characterSpacing = 0
        bodyTextStyle.paragraphSpacing = -3
        
        return bodyTextStyle
    }
    
}
