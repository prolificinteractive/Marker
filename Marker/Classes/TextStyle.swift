//
//  TextStyle.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

public protocol TextStyle {
    
    var font: UIFont { get }
    
    var emFont: UIFont { get }
    
    var strongFont: UIFont { get }
    
    var textColor: UIColor { get }
    
    var lineHeight: CGFloat? { get }
    
    var paragraphSpacing: CGFloat? { get }
    
    var textAlignment: NSTextAlignment? { get }
    
    var lineBreakMode: NSLineBreakMode? { get }
    
    var characterSpacing: CGFloat? { get }
    
}

public extension TextStyle {
    
    var emFont: UIFont {
        return font
    }
    
    var strongFont: UIFont {
        return font
    }
    
    var lineHeight: CGFloat? {
        return nil
    }
    
    var paragraphSpacing: CGFloat? {
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
