//
//  TextStyle.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

/**
 *  Encapsulates style information to be applied when displaying text.
 */
public struct TextStyle {

    /// Font for displaying regular text.
    public var font: UIFont
    
    /// Font for displaying emphasized text.
    public var emFont: UIFont
    
    /// Font for displaying important text.
    public var strongFont: UIFont
    
    /// Text color.
    public var textColor: UIColor?
    
    /// Character spacing/kerning.
    public var characterSpacing: CGFloat?

    /// Line spacing.
    public var lineSpacing: CGFloat?

    /// Line height multiple.
    public var lineHeightMultiple: CGFloat?
    
    /// Minimum line height.
    public var minimumLineHeight: CGFloat?
    
    /// Maximum line height.
    public var maximumLineHeight: CGFloat?
    
    /// Paragraph spacing.
    public var paragraphSpacing: CGFloat?

    /// Paragraph spacing before.
    public var paragraphSpacingBefore: CGFloat?
    
    /// Text alignment.
    public var textAlignment: NSTextAlignment?
    
    /// Line break mode.
    public var lineBreakMode: NSLineBreakMode?
    
    // MARK: - Init/Deinit
    
    public init(font: UIFont,
                emFont: UIFont? = nil,
                strongFont: UIFont? = nil,
                textColor: UIColor? = nil,
                characterSpacing: CGFloat? = nil,
                lineSpacing: CGFloat? = nil,
                lineHeightMultiple: CGFloat? = nil,
                minimumLineHeight: CGFloat? = nil,
                maximumLineHeight: CGFloat? = nil,
                paragraphSpacing: CGFloat? = nil,
                paragraphSpacingBefore: CGFloat? = nil,
                textAlignment: NSTextAlignment? = nil,
                lineBreakMode: NSLineBreakMode? = nil) {
        self.font = font
        self.emFont = (emFont == nil) ? font : emFont!
        self.strongFont = (strongFont == nil) ? font : strongFont!
        self.textColor = textColor
        self.characterSpacing = characterSpacing
        self.lineSpacing = lineSpacing
        self.lineHeightMultiple = lineHeightMultiple
        self.minimumLineHeight = minimumLineHeight
        self.maximumLineHeight = maximumLineHeight
        self.paragraphSpacing = paragraphSpacing
        self.paragraphSpacingBefore = paragraphSpacingBefore
        self.textAlignment = textAlignment
        self.lineBreakMode = lineBreakMode
    }
    
}
