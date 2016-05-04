//
//  PabloTextStyle.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import Marker

internal struct PabloTextStyle: TextStyle {
    
    let font: UIFont = UIFont.systemFontOfSize(23)
    
    let emFont: UIFont = UIFont.italicSystemFontOfSize(23)
    
    let strongFont: UIFont = UIFont.boldSystemFontOfSize(23)
    
    let characterSpacing: CGFloat? = 2
    
}
