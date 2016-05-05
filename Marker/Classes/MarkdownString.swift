//
//  MarkdownString.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Foundation

/**
 Returns formatted Markdown text as an attributed string.
 
 - parameter parsedString: String stripped of markup.
 - parameter tags:         Mark up tags.
 - parameter textStyle:    Text style object containing markup fonts.
 
 - returns: Formatted markdown text.
 */
internal func attributedStringFromParsedString(parsedString: String, tags: [MarkdownParser.Tag], textStyle: TextStyle) -> NSAttributedString {
    let attributedString = NSMutableAttributedString(string: parsedString)
    
    attributedString.addAttributes(textAttributesFromTextStyle(textStyle),
                                   range: NSRange(location: 0, length: parsedString.characters.count))
    
    for tag in tags {
        let font: UIFont?
        
        switch tag {
        case .Em(_):
            font = textStyle.emFont
        case .Strong(_):
            font = textStyle.strongFont
        }
        
        if let font = font {
            attributedString.addAttributes([NSFontAttributeName: font], range: parsedString.NSRangeFromRange(tag.range()))
        }
    }
    
    return attributedString
}

// Source: http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index/30404532#30404532
private extension String {
    
    func NSRangeFromRange(range: Range<String.Index>) -> NSRange {
        let from = String.UTF16View.Index(range.startIndex, within: utf16)
        let to = String.UTF16View.Index(range.endIndex, within: utf16)
        
        return NSRange(location: utf16.startIndex.distanceTo(from), length: from.distanceTo(to))
    }
    
}
