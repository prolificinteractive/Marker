//
//  MarkerLabel.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UILabel {
    
    func setText(text: String, textStyle: TextStyle) {
        attributedText = NSAttributedString(string: text, attributes: textAttributesFromTextStyle(textStyle))
    }
    
    func setMarkdownText(markdownText: String, textStyle: TextStyle) {
        do {
            let (strippedString, tags) = try MarkdownParser.parseString(markdownText)
            let attributedString = NSMutableAttributedString(string: strippedString)
            
            attributedString.addAttributes(textAttributesFromTextStyle(textStyle),
                                           range: NSRange(location: 0, length: strippedString.characters.count))
            
            for tag in tags {
                let font: UIFont?
                
                switch tag {
                case .Em(_):
                    font = textStyle.emFont
                case .Strong(_):
                    font = textStyle.strongFont
                }
                
                if let font = font {
                    attributedString.addAttributes([NSFontAttributeName: font], range: strippedString.NSRangeFromRange(tag.range()))
                }
            }
            
            attributedText = attributedString
        } catch {
            text = markdownText
        }
    }
        
}
