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
        switch UIApplication.sharedApplication().preferredContentSizeCategory {
        case UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall:
            return 13
        case UIContentSizeCategoryMedium, UIContentSizeCategoryLarge:
            return 17
        case UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge:
            return 20
        case UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium:
            return 23
        case UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge:
            return 26
        case UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge:
            return 32
        default:
            return 17
        }
    }
    
}
