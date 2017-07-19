//
//  AvenirNextFont.swift
//  Marker
//
//  Created by Htin Linn on 6/9/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker

internal struct AvenirNextFont: FontFamily {
    
    // MARK: - Protocol conformance
    
    // MARK: Font
    
    var familyName: String {
        return "Avenir Next"
    }
    
    func regularFont(ofSize size: CGFloat) -> Font {
        return Font(name: "AvenirNext-Regular", size: size)!
    }
    
    func boldFont(ofSize size: CGFloat) -> Font {
        return Font(name: "AvenirNext-Bold", size: size)!
    }
    
    func italicFont(ofSize size: CGFloat) -> Font {
        return Font(name: "AvenirNext-Italic", size: size)!
    }
    
}
