//
//  MarkerTextField.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UITextField {

    func setText(text: String, textStyle: TextStyle) {
        attributedText = NSAttributedString(string: text, attributes: textAttributesFromTextStyle(textStyle))
    }
    
    func setMarkdownText(markdownText: String, textStyle: TextStyle) {
        do {
            let (parsedString, tags) = try MarkdownParser.parseString(markdownText)
            attributedText = attributedStringFromParsedString(parsedString, tags: tags, textStyle: textStyle)
        } catch {
            text = markdownText
        }
    }
    
}
