//
//  Marker.swift
//  Marker
//
//  Created by Htin Linn on 5/15/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Returns formatted Markdown text as an attributed string.
///
/// - Parameters:
///   - markdownText: String with Markdown tags.
///   - textStyle: Text style object containing style information.
/// - Returns: Formatted Markdown text.
public func attributedMarkdownString(from markdownText: String,
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

/// Returns formatted text as an attributed string with custom markup attributes applied.
///
/// - Parameters:
///   - text: Text.
///   - textStyle: Text style object containing style information.
///   - markups: Markup information.
/// - Returns: Formatted text.
public func attributedMarkupString(from text: String,
                                   using textStyle: TextStyle,
                                   customMarkup markups: Markup) -> NSAttributedString {
    guard
        markups.count > 0,
        let (parsedString, elements) = try? ElementParser.parse(text, for: markups.map { Symbol(character: $0.0) }) else {
            return NSAttributedString(string: text, textStyle: textStyle)
    }
    
    let attributedString = NSMutableAttributedString(string: textStyle.textTransform.applied(to: parsedString))
    attributedString.addAttributes(textStyle.attributes,
                                   range: NSRange(location: 0, length: parsedString.characters.count))
    
    elements.forEach { (element) in
        if let markup = markups[Character(element.symbol.rawValue)] {
            attributedString.addAttributes(markup.attributes, range: parsedString.range(from: element.range))
        }
    }
    
    return attributedString
}
