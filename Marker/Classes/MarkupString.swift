//
//  MarkupString.swift
//  Marker
//
//  Created by Htin Linn on 5/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// Returns formatted text as an attributed string with custom markup attributes applied.
///
/// - Parameters:
///   - text: Text.
///   - textStyle: Text style object containing style information.
///   - markups: Markup information.
/// - Returns: Formatted text.
internal func attributedMarkupString(from text: String,
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
