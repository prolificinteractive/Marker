//
//  TextStyle.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public protocol TextStyle {
    
    var textColor: UIColor? { get }

    var font: UIFont { get }
    
    var emFont: UIFont { get }
    
    var strongFont: UIFont { get }
    
    var characterSpacing: CGFloat? { get }

    var lineSpacing: CGFloat? { get }

    var lineHeightMultiple: CGFloat? { get }
    
    var minimumLineHeight: CGFloat? { get }
    
    var maximumLineHeight: CGFloat? { get }
    
    var paragraphSpacing: CGFloat? { get }

    var paragraphSpacingBefore: CGFloat? { get }
    
    var textAlignment: NSTextAlignment? { get }
    
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
