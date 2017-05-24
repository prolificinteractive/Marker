//
//  NSTextFieldExtension.swift
//  Marker
//
//  Created by Michael Campbell on 5/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import AppKit

public extension NSTextField {

    /// Creates a text field based on text passed to an attributed string created from the specified string and text style.
    ///
    /// - Parameters:
    ///   - text: The text to be displayed in the text field.
    ///   - textStyle:  Text style object containing style information.
    ///   - markups: Custom markup if there is any. Defaults to zero custom markup.
    /// - Returns: A NSTextField instance.
    convenience init(_ text: String, using textStyle: TextStyle, customMarkup markups: Markup = [:]) {
        let attributedText = attributedMarkupString(from: text, using: textStyle, customMarkup: markups)

        self.init(labelWithAttributedString: attributedText)
    }

    /// Creates a text field based on text passed to an attributed string created from the specified string and text style.
    ///
    /// - Parameters:
    ///   - markdownText: The Markdown text to be displayed in the text field.
    ///   - textStyle: Text style object containing style information.
    /// - Returns: A NSTextField instance.
    convenience init(_ markdownText: String, using textStyle: TextStyle) {
        let attributedText = attributedMarkdownString(from: markdownText, using: textStyle)

        self.init(labelWithAttributedString: attributedText)
    }
    
}
