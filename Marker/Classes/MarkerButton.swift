//
//  MarkerButton.swift
//  Marker
//
//  Created by Htin Linn on 11/14/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UIButton {
    
    /**
     Sets the button's title to an attributed string created from the specified string and text style.
     
     - parameter text:      The text to be displayed in the label.
     - parameter textStyle: Text style object containing style information.
     */
    func setTitleText(_ text: String, using textStyle: TextStyle, customMarkup markups: Markup = [:]) {
        setAttributedTitle(attributedMarkupString(from: text, using: textStyle, customMarkup: markups), for: .normal)
    }
    
    /**
     Sets the button's title text to an attributed string created from the specified string and text style.
     This function treats the specified string as a Markdown formatted string and applies appropriate styling to it.
     Refer to MarkerdownParser.Tag for a list of supported Markdown tags.
     
     - parameter markdownText: The Markdown text to be displayed in the label.
     - parameter textStyle:    Text style object containing style information.
     */
    func setMarkdownTitleText(_ markdownText: String, using textStyle: TextStyle) {
        setAttributedTitle(attributedMarkdownString(from: markdownText, using: textStyle), for: .normal)
    }
    
}
