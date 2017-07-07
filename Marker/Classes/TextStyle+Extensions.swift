//
//  TextStyle+Extensions.swift
//  Marker
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import UIKit

/// Adds factory functions producing new TextStyle from existing TextStyle.
public extension TextStyle {
    
    /// Creates new TextStyle from exisiting TextStyle, updating with provided values.Creates
    ///
    /// - Parameter newFont: New font to use.
    /// - Returns: New TextStyle.
    public func with(newFont: UIFont? = nil,
                     newEmFont: UIFont? = nil,
                     newStrongFont: UIFont? = nil,
                     newTextColor: UIColor? = nil,
                     newCharacterSpacing: CGFloat? = nil,
                     newLineSpacing: CGFloat? = nil,
                     newLineHeightMultiple: CGFloat? = nil,
                     newMinimumLineHeight: CGFloat? = nil,
                     newMaximumLineHeight: CGFloat? = nil,
                     newFirstLineHeadIndent: CGFloat? = nil,
                     newHeadIndent: CGFloat? = nil,
                     newParagraphSpacing: CGFloat? = nil,
                     newParagraphSpacingBefore: CGFloat? = nil,
                     newTextAlignment: NSTextAlignment? = nil,
                     newLineBreakMode: NSLineBreakMode? = nil,
                     newStrikethroughStyle: NSUnderlineStyle? = nil,
                     newStrikethroughColor: UIColor? = nil,
                     newTextTransform: TextTransform? = nil) -> TextStyle {
        let fontToUse = (newFont == nil) ? self.font : newFont!
        let emFontToUse = (newEmFont == nil) ? self.emFont : newEmFont!
        let strongFontToUse = (newStrongFont == nil) ? self.strongFont : newStrongFont!
        let textColorToUse = (newTextColor == nil) ? self.textColor : newTextColor!
        let characterSpacingToUse = (newCharacterSpacing == nil) ? self.characterSpacing : newCharacterSpacing!
        let lineSpacingToUse = (newLineSpacing == nil) ? self.lineSpacing : newLineSpacing!
        let lineHeightMultipleToUse = (newLineHeightMultiple == nil) ? self.lineHeightMultiple : newLineHeightMultiple!
        let minimumLineHeightToUse = (newMinimumLineHeight == nil) ? self.minimumLineHeight : newMinimumLineHeight!
        let maximumLineHeightToUse = (newMaximumLineHeight == nil) ? self.maximumLineHeight : newMaximumLineHeight!
        let firstLineHeadIndentToUse = (newFirstLineHeadIndent == nil) ? self.firstLineHeadIndent : newFirstLineHeadIndent!
        let headIndentToUse = (newHeadIndent == nil) ? self.headIndent : newHeadIndent!
        let paragraphSpacingToUse = (newParagraphSpacing == nil) ? self.paragraphSpacing : newParagraphSpacing!
        let paragraphSpacingBeforeToUse = (newParagraphSpacingBefore == nil) ? self.paragraphSpacingBefore : newParagraphSpacingBefore!
        let textAlignmentToUse = (newTextAlignment == nil) ? self.textAlignment : newTextAlignment!
        let lineBreakModeToUse = (newLineBreakMode == nil) ? self.lineBreakMode : newLineBreakMode!
        let strikethroughStyleToUse = (newStrikethroughStyle == nil) ? self.strikethroughStyle : newStrikethroughStyle!
        let strikethroughColorToUse = (newStrikethroughColor == nil) ? self.strikethroughColor : newStrikethroughColor!
        let textTransformToUse = (newTextTransform == nil) ? self.textTransform : newTextTransform!
        
        return TextStyle(
            font: fontToUse,
            emFont: emFontToUse,
            strongFont: strongFontToUse,
            textColor: textColorToUse,
            characterSpacing: characterSpacingToUse,
            lineSpacing: lineSpacingToUse,
            lineHeightMultiple: lineHeightMultipleToUse,
            minimumLineHeight: minimumLineHeightToUse,
            maximumLineHeight: maximumLineHeightToUse,
            firstLineHeadIndent: firstLineHeadIndentToUse,
            headIndent: headIndentToUse,
            paragraphSpacing: paragraphSpacingToUse,
            paragraphSpacingBefore: paragraphSpacingBeforeToUse,
            textAlignment: textAlignmentToUse,
            lineBreakMode: lineBreakModeToUse,
            strikethroughStyle: strikethroughStyleToUse,
            strikethroughColor: strikethroughColorToUse,
            textTransform: textTransformToUse
        )
    }
    
}

// MARK: - Protocol conformance

// MARK: Equatable

extension TextStyle: Equatable { }

public func ==(lhs: TextStyle, rhs: TextStyle) -> Bool {
    guard lhs.font == rhs.font,
        lhs.emFont == rhs.emFont,
        lhs.strongFont == rhs.strongFont,
        lhs.textColor == rhs.textColor,
        lhs.characterSpacing == rhs.characterSpacing,
        lhs.lineSpacing == rhs.lineSpacing,
        lhs.lineHeightMultiple == rhs.lineHeightMultiple,
        lhs.minimumLineHeight == rhs.minimumLineHeight,
        lhs.maximumLineHeight == rhs.maximumLineHeight,
        lhs.firstLineHeadIndent == rhs.firstLineHeadIndent,
        lhs.headIndent == rhs.headIndent,
        lhs.paragraphSpacing == rhs.paragraphSpacing,
        lhs.paragraphSpacingBefore == rhs.paragraphSpacingBefore,
        lhs.textAlignment == rhs.textAlignment,
        lhs.lineBreakMode == rhs.lineBreakMode,
        lhs.strikethroughStyle == rhs.strikethroughStyle,
        lhs.strikethroughColor == rhs.strikethroughColor,
        lhs.textTransform == rhs.textTransform else {
        return false
    }
    
    return true
}
