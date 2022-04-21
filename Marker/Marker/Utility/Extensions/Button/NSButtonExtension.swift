//
//  NSButtonExtension.swift
//  Marker
//
//  Created by Michael Campbell on 5/24/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

#if os(macOS)

import AppKit

public extension NSButton {

    /// Sets the button's title to an attributed string created from the specified string and text style.
    ///
    /// - Parameters:
    ///   - text: The text to be displayed in the label.
    ///   - textStyle: Text style object containing style information.
    ///   - markups: Custom markup if there is any. Defaults to zero custom markup.
    func setTitleText(_ text: String, using textStyle: TextStyle, customMarkup markups: Markup = [:]) {
        attributedTitle = attributedMarkupString(from: text, using: textStyle, customMarkup: markups)
    }

    /// Sets the button's title text to an attributed string created from the specified string and text style.
    /// This function treats the specified string as a Markdown formatted string and applies appropriate styling to it.
    /// Refer to MarkerdownParser.Tag for a list of supported Markdown tags.
    ///
    /// - Parameters:
    ///   - markdownText: The Markdown text to be displayed in the label.
    ///   - textStyle: Text style object containing style information.
    func setMarkdownTitleText(_ markdownText: String, using textStyle: TextStyle) {
        attributedTitle = attributedMarkdownString(from: markdownText, using: textStyle)
    }

}

#endif
