//
//  Marker.swift
//  Marker
//
//  Created by Htin Linn on 5/15/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS) || os(OSX)
    import AppKit
#endif

/// Parses Markdown text and eturns formatted text as an attributed string with custom markup attributes applied.
/// If the parsing failed, specified Markdown tags are ignored. Yet, the rest of the style information is still applied.
///
/// - Parameters:
///   - text: Text.
///   - textStyle: Text style object containing style information.
///   - markups: Markup information.
/// - Returns: Formatted text.
public func attributedMarkdownString(from markdownText: String,
                                     using textStyle: TextStyle) -> NSAttributedString {
    do {
        return try parsedMarkdownString(from: markdownText, using: textStyle)
    } catch {
        return NSAttributedString(string: markdownText, textStyle: textStyle)
    }
}

/// Parses custom mark up information and returns formatted text as an attributed string with custom markup attributes applied.
/// If the parsing failed, custom markup attributes are ignored. Yet, style information from `textStyle` parameter is still applied.
///
/// - Parameters:
///   - text: Text.
///   - textStyle: Text style object containing style information.
///   - markups: Markup information.
/// - Returns: Formatted text.
public func attributedMarkupString(from text: String,
                                   using textStyle: TextStyle,
                                   customMarkup markups: Markup) -> NSAttributedString {
    do {
        return try parsedMarkupString(from: text, using: textStyle, customMarkup: markups)
    } catch {
        return NSAttributedString(string: text, textStyle: textStyle)
    }
}

/// Returns formatted Markdown text as an attributed string.
///
/// - Parameters:
///   - markdownText: String with Markdown tags.
///   - textStyle: Text style object containing style information.
/// - Returns: Formatted Markdown text.
/// - Throws: Parser error.
public func parsedMarkdownString(from markdownText: String,
                                 using textStyle: TextStyle) throws -> NSAttributedString {
    let (parsedString, elements) = try MarkdownParser.parse(markdownText)
    
    let attributedString = NSMutableAttributedString(string: textStyle.textTransform.applied(to: parsedString))
    attributedString.addAttributes(textStyle.attributes,
                                   range: NSRange(location: 0, length: parsedString.characters.count))
    
    elements.forEach { (element) in
        var font: Font? = nil
        var strikethroughStyle: NSUnderlineStyle? = nil
        var underlineStyle: NSUnderlineStyle? = nil
        
        switch element {
        case .em(_):
            font = textStyle.emFont
        case .strong(_):
            font = textStyle.strongFont
        case .strikethrough(_):
            strikethroughStyle = textStyle.strikethroughStyle
        case .underline(_):
            underlineStyle = textStyle.underlineStyle
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
        
        if let underlineStyle = underlineStyle {
            attributedString.addAttributes([NSUnderlineStyleAttributeName: underlineStyle.rawValue], range: parsedString.range(from: element.range))
            
            if let underlineColor = textStyle.underlineColor {
                attributedString.addAttributes([NSUnderlineColorAttributeName: underlineColor], range: parsedString.range(from: element.range))
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
/// - Throws: Parser error.
public func parsedMarkupString(from text: String,
                               using textStyle: TextStyle,
                               customMarkup markups: Markup) throws -> NSAttributedString {
    guard markups.count > 0 else {
        return NSAttributedString(string: text, textStyle: textStyle)
    }

    let (parsedString, elements) = try ElementParser.parse(text, for: markups.map { Symbol(character: $0.0) })
    
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
