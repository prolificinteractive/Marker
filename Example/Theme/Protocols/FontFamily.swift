//
//  FontFamily.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker

internal protocol FontFamily {
    
    var familyName: String { get }
    
    func regularFont(ofSize size: CGFloat) -> Font
    func boldFont(ofSize size: CGFloat) -> Font
    func italicFont(ofSize size: CGFloat) -> Font
    
}
