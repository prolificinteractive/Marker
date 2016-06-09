//
//  Fonts.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol Fonts {
    
    var familyName: String { get }
    
    func regularFont(size: CGFloat) -> UIFont
    func boldFont(size: CGFloat) -> UIFont
    func italicFont(size: CGFloat) -> UIFont
    
}
