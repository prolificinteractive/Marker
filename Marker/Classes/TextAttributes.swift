//
//  TextAttributes.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal typealias TextAttributes = [String: NSObject]

internal func textAttributesFromTextStyle(textStyle: TextStyle) -> TextAttributes {
    var textAttributes: TextAttributes = [:]
    
    
    textAttributes[NSForegroundColorAttributeName] = textStyle.textColor
    textAttributes[NSFontAttributeName] = textStyle.font
    textAttributes[NSKernAttributeName] = textStyle.characterSpacing

    
    let paragraphStyle = NSMutableParagraphStyle()
    
    if let lineSpacing = textStyle.lineSpacing {
        paragraphStyle.lineSpacing = lineSpacing
    }
    if let lineHeightMultiple = textStyle.lineHeightMultiple {
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
    }
    if let minimumLineHeight = textStyle.minimumLineHeight {
        paragraphStyle.minimumLineHeight = minimumLineHeight
    }
    if let maximumLineHeight = textStyle.maximumLineHeight {
        paragraphStyle.maximumLineHeight = maximumLineHeight
    }
 
    if let paragraphSpacing = textStyle.paragraphSpacing {
        paragraphStyle.paragraphSpacing = paragraphSpacing
    }
    if let paragraphSpacingBefore = textStyle.paragraphSpacingBefore {
        paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore
    }
    
    if let alignment = textStyle.textAlignment {
        paragraphStyle.alignment = alignment
    }

    if let lineBreakMode = textStyle.lineBreakMode {
        paragraphStyle.lineBreakMode = lineBreakMode
    }
    
    textAttributes[NSParagraphStyleAttributeName] = paragraphStyle
    

    return textAttributes
}
