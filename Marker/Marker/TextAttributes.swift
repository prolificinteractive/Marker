//
//  TextAttributes.swift
//  Marker
//
//  Created by Htin Linn on 9/20/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS) || os(OSX)
    import AppKit
#endif

/// Text attributes.
public typealias TextAttributes = [NSAttributedString.Key: Any]

struct AttributedStringKey {
    
    static let font = NSAttributedString.Key.font
    static let foregroundColor = NSAttributedString.Key.foregroundColor
    static let kern = NSAttributedString.Key.kern
    static let link = NSAttributedString.Key.link
    static let paragraphStyle = NSAttributedString.Key.paragraphStyle
    static let strikethroughStyle = NSAttributedString.Key.strikethroughStyle
    static let strikethroughColor = NSAttributedString.Key.strikethroughColor
    static let underlineStyle = NSAttributedString.Key.underlineStyle
    static let underlineColor = NSAttributedString.Key.underlineColor
    
}
