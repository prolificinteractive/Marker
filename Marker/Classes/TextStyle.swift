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
public protocol TextStyle {
    
    /// Text color.
    var textColor: UIColor? { get }

    /// Font for displaying regular text.
    var font: UIFont { get }
    
    /// Font for displaying emphasized text.
    var emFont: UIFont { get }
    
    /// Font for displaying important text.
    var strongFont: UIFont { get }
    
    /// Character spacing/kerning.
    var characterSpacing: CGFloat? { get }

    /// Line spacing.
    var lineSpacing: CGFloat? { get }

    /// Line height multiple.
    var lineHeightMultiple: CGFloat? { get }
    
    /// Minimum line height.
    var minimumLineHeight: CGFloat? { get }
    
    /// Maximum line height.
    var maximumLineHeight: CGFloat? { get }
    
    /// Paragraph spacing.
    var paragraphSpacing: CGFloat? { get }

    /// Paragraph spacing before.
    var paragraphSpacingBefore: CGFloat? { get }
    
    /// Text alignment.
    var textAlignment: NSTextAlignment? { get }
    
    /// Line break mode.
    var lineBreakMode: NSLineBreakMode? { get }
    
}

public extension TextStyle {
    
    var emFont: UIFont {
        return font
    }
    
    var strongFont: UIFont {
        return font
    }
    
    var textColor: UIColor? {
        return nil
    }
    
    var lineSpacing: CGFloat? {
        return nil
    }
    
    var lineHeightMultiple: CGFloat? {
        return nil
    }
    
    var minimumLineHeight: CGFloat? {
        return nil
    }
    
    var maximumLineHeight: CGFloat? {
        return nil
    }
    
    var paragraphSpacing: CGFloat? {
        return nil
    }
    
    var paragraphSpacingBefore: CGFloat? {
        return nil
    }
    
    var textAlignment: NSTextAlignment? {
        return nil
    }
    
    var lineBreakMode: NSLineBreakMode? {
        return nil
    }
    
    var characterSpacing: CGFloat? {
        return nil
    }
    
}
