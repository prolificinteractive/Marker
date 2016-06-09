//
//  AvenirNextFonts.swift
//  Marker
//
//  Created by Htin Linn on 6/9/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal struct AvenirNextFonts: Fonts {
    
    // MARK: - Protocol conformance
    
    // MARK: Fonts
    
    func regularFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: size)!
    }
    
    func boldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: size)!
    }
    
    func italicFont(size: CGFloat) -> UIFont {
        return UIFont(name: "AvenirNext-Italic", size: size)!
    }
    
}
