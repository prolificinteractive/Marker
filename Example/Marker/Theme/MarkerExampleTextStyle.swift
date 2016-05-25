//
//  MarkerExampleTextStyle.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker

internal struct MarkerExampleTextStyle: TextStyle {
    
    var font: UIFont
    var emFont: UIFont
    var strongFont: UIFont
    var characterSpacing: CGFloat?
    var lineSpacing: CGFloat?
    var paragraphSpacing: CGFloat?
    
    init(font: UIFont,
         emFont: UIFont? = nil,
         strongFont: UIFont? = nil,
         characterSpacing: CGFloat? = nil,
         lineSpacing: CGFloat? = nil,
         paragraphSpacing: CGFloat? = nil) {

        self.font = font
        self.emFont = (emFont == nil) ? font : emFont!
        self.strongFont = (strongFont == nil) ? font : strongFont!
        self.characterSpacing = characterSpacing
        self.lineSpacing = lineSpacing
        self.paragraphSpacing = paragraphSpacing
    }
    
}
