//
//  NSTextFieldExtension.swift
//  Marker
//
//  Created by Michael Campbell on 5/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

#if os(macOS)

import AppKit

public extension NSTextField {

    /// Sets the text view text to an attributed string created from the specified string and text style.
    ///
    /// - Parameters:
    ///   - text: The text to be displayed in the text view.
    ///   - textStyle: Text style object containing style information.
    ///   - markups: Custom markup if there is any. Defaults to zero custom markup.
    func setText(_ text: String, using textStyle: TextStyle, customMarkup markups: Markup = [:]) {
        attributedStringValue = attributedMarkupString(from: text, using: textStyle, customMarkup: markups)
    }

    /// Sets the text view text to an attributed string created from the specified string and text style.
    /// This function treats the specified string as a Markdown formatted string and applies appropriate styling to it.
    /// Refer to MarkerdownElement for a list of supported Markdown tags.
    ///
    /// - Parameters:
    ///   - markdownText: The Markdown text to be displayed in the text view.
    ///   - textStyle: Text style object containing style information.
    func setMarkdownText(_ markdownText: String, using textStyle: TextStyle) {
        attributedStringValue = attributedMarkdownString(from: markdownText, using: textStyle)
    }

}

#endif
