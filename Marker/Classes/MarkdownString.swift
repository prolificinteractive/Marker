//
//  MarkdownString.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Foundation

/// Returns formatted Markdown text as an attributed string.
///
/// - Parameters:
///   - markdownText: String with Markdown tags.
///   - textStyle: Text style object containing style information.
/// - Returns: Formatted Markdown text.
internal func attributedMarkdownString(from markdownText: String,
                                       using textStyle: TextStyle) -> NSAttributedString {
    guard let (parsedString, elements) = try? MarkdownParser.parse(markdownText) else {
        return NSAttributedString(string: markdownText, textStyle: textStyle)
    }
    
    let attributedString = NSMutableAttributedString(string: textStyle.textTransform.applied(to: parsedString))
    attributedString.addAttributes(textStyle.attributes,
                                   range: NSRange(location: 0, length: parsedString.characters.count))
    
    elements.forEach { (element) in
        var font: UIFont? = nil
        var strikethroughStyle: NSUnderlineStyle? = nil
        
        switch element {
        case .em(_):
            font = textStyle.emFont
        case .strong(_):
            font = textStyle.strongFont
        case .strikethrough(_):
            strikethroughStyle = textStyle.strikethroughStyle
        }
        
        if let font = font {
            attributedString.addAttributes([NSFontAttributeName: font], range: parsedString.range(from: element.range))
        }
        
        if let strikethroughStyle = strikethroughStyle {
            attributedString.addAttributes([NSStrikethroughStyleAttributeName: strikethroughStyle.rawValue],
                                           range: parsedString.range(from: element.range))
            
            if let strikethroughColor = textStyle.strikethroughColor {
                attributedString.addAttributes([NSStrikethroughColorAttributeName: strikethroughColor],
                                               range: parsedString.range(from: element.range))
            }
        }
    }
    
    return attributedString
}
