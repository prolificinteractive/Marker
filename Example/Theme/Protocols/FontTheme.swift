//
//  FontTheme.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS)
    import AppKit
#endif

internal protocol FontTheme {

    var headlineTextStyle: TextStyle { get }
    var titleTextStyle: TextStyle { get }
    var bodyTextStyle: TextStyle { get }

    var headlineFontSize: CGFloat { get }
    var titleFontSize: CGFloat { get }

}

extension FontTheme {

#if os(iOS) || os(tvOS)

    var headlineFontSize: CGFloat {
        switch UIApplication.shared.preferredContentSizeCategory {
        case UIContentSizeCategory.extraSmall, UIContentSizeCategory.small:
            return 13
        case UIContentSizeCategory.medium, UIContentSizeCategory.large:
            return 17
        case UIContentSizeCategory.extraLarge, UIContentSizeCategory.extraExtraLarge:
            return 20
        case UIContentSizeCategory.extraExtraExtraLarge, UIContentSizeCategory.accessibilityMedium:
            return 23
        case UIContentSizeCategory.accessibilityLarge, UIContentSizeCategory.accessibilityExtraLarge:
            return 26
        case UIContentSizeCategory.accessibilityExtraExtraLarge, UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            return 32
        default:
            return 17
        }
    }

    var titleFontSize: CGFloat {
        switch UIApplication.shared.preferredContentSizeCategory {
        case UIContentSizeCategory.extraSmall, UIContentSizeCategory.small:
            return 15
        case UIContentSizeCategory.medium, UIContentSizeCategory.large:
            return 19
        case UIContentSizeCategory.extraLarge, UIContentSizeCategory.extraExtraLarge:
            return 23
        case UIContentSizeCategory.extraExtraExtraLarge, UIContentSizeCategory.accessibilityMedium,
             UIContentSizeCategory.accessibilityLarge, UIContentSizeCategory.accessibilityExtraLarge,
             UIContentSizeCategory.accessibilityExtraExtraLarge, UIContentSizeCategory.accessibilityExtraExtraExtraLarge:
            return 30
        default:
            return 19
        }
    }

#elseif os(macOS)

    var headlineFontSize: CGFloat {
        return 17
    }

    var titleFontSize: CGFloat {
        return 19
    }
    
#endif

}
