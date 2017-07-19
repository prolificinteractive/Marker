//
//  HelveticaNeueFont.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker

internal struct HelveticaNeueFont: FontFamily {
    
    // MARK: - Protocol conformance
    
    // MARK: Font
    
    var familyName: String {
        return "Helvetica Neue"
    }
    
    func regularFont(ofSize size: CGFloat) -> Font {
        return Font(name: "HelveticaNeue", size: size)!
    }
    
    func boldFont(ofSize size: CGFloat) -> Font {
        return Font(name: "HelveticaNeue-Bold", size: size)!
    }
    
    func italicFont(ofSize size: CGFloat) -> Font {
        return Font(name: "HelveticaNeue-Italic", size: size)!
    }
    
}
