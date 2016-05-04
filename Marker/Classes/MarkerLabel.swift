//
//  MarkerLabel.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public extension UILabel {
    
    /**
     Sets the label text to the specified Markdown text using given fonts.
     
     - parameter markdownText: The Markdown text to be set.
     - parameter fonts:        Fonts to be used when setting the text.
     */
    func setMarkdownText(markdownText: String, fonts: (boldFont: UIFont, italicFont: UIFont)) {
        do {
            let (strippedString, tags) = try MarkdownParser.parseString(markdownText)
            let attributedString = NSMutableAttributedString(string: strippedString)
            
            for tag in tags {
                let font: UIFont?
                
                switch tag {
                case .Em(_):
                    font = fonts.italicFont
                case .Strong(_):
                    font = fonts.boldFont
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
    
    /**
     Sets line height for the receiver's text.
     This function does nothing if the receiver's text property is nil.
     
     - parameter lineHeight: Line height.
     */
    func setLineHeight(lineHeight: CGFloat?) {
        setLineHeight(lineHeight, paragraphSpacing: nil)
    }
    
    /**
     Sets paragraph spacing for the receiver's text.
     This function does nothing if the receiver's text property is nil.
     
     - parameter paragraphSpacing: Paragraph spacing.
     */
    func setParagraphSpacing(paragraphSpacing: CGFloat?) {
        setLineHeight(nil, paragraphSpacing: paragraphSpacing)
    }
    
    // MARK: - Private functions
    
    private func fullStringParagraphStyle() -> NSParagraphStyle? {
        guard let currentText = attributedText where currentText.string.characters.count > 0 else {
            return nil
        }
        
        var currentParagraphStyle: NSParagraphStyle? = nil
        let fullStringRange = NSRange(location: 0, length: currentText.string.characters.count)
        
        currentText.enumerateAttribute(NSParagraphStyleAttributeName,
                                       inRange: fullStringRange,
                                       options: []) { (value, effectiveRange, stop) -> Void in
                                        if NSEqualRanges(effectiveRange, fullStringRange) {
                                            if currentParagraphStyle == nil {
                                                currentParagraphStyle = value as? NSParagraphStyle
                                                return
                                            }
                                        }
        }
        
        return currentParagraphStyle
    }
    
    private func setLineHeight(lineHeight: CGFloat? = nil, paragraphSpacing: CGFloat?) {
        guard let currentText = attributedText else {
            return
        }
        
        let attributedString = NSMutableAttributedString(attributedString: currentText)
        let paragraphStyle = NSMutableParagraphStyle()
        
        if let currentParagraphStyle = fullStringParagraphStyle() {
            paragraphStyle.setParagraphStyle(currentParagraphStyle)
        }
        
        if let lineHeight = lineHeight {
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.minimumLineHeight = lineHeight
        }
        
        if let paragraphSpacing = paragraphSpacing {
            paragraphStyle.paragraphSpacing = paragraphSpacing
        }
        
        attributedString.addAttributes([NSParagraphStyleAttributeName: paragraphStyle], range: NSRange(location: 0, length: currentText.string.characters.count))
        
        attributedText = attributedString
    }
    
}
