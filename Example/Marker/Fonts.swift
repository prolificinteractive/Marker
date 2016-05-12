//
//  Fonts.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol Fonts {
    
    var headlineFontSize: CGFloat { get }
    
    var headlineFont: UIFont { get }
    var headlineFontBold: UIFont { get }
    var headlineFontItalic: UIFont { get }
    
}

extension Fonts {
    
    var headlineFontSize: CGFloat {
        return 23
    }
    
}
