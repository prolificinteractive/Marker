//
//  FontTheme.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol FontTheme {
    
    var headlineTextStyle: MarkerExampleTextStyle { get }
    var titleTextStyle: MarkerExampleTextStyle { get }
    var bodyTextStyle: MarkerExampleTextStyle { get }
    
    var headlineFontSize: CGFloat { get }
    var titleFontSize: CGFloat { get }
    
}

extension FontTheme {
    
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
    
    var titleFontSize: CGFloat {
        switch UIApplication.sharedApplication().preferredContentSizeCategory {
        case UIContentSizeCategoryExtraSmall, UIContentSizeCategorySmall:
            return 15
        case UIContentSizeCategoryMedium, UIContentSizeCategoryLarge:
            return 19
        case UIContentSizeCategoryExtraLarge, UIContentSizeCategoryExtraExtraLarge:
            return 23
        case UIContentSizeCategoryExtraExtraExtraLarge, UIContentSizeCategoryAccessibilityMedium,
             UIContentSizeCategoryAccessibilityLarge, UIContentSizeCategoryAccessibilityExtraLarge,
             UIContentSizeCategoryAccessibilityExtraExtraLarge, UIContentSizeCategoryAccessibilityExtraExtraExtraLarge:
            return 30
        default:
            return 19
        }
    }
    
}
