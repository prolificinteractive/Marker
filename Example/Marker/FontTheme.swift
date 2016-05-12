//
//  FontTheme.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol FontTheme {
    
    var labelTextStyle: PabloTextStyle { get }
    var textFieldTextStyle: PabloTextStyle { get }
    var textViewTextStyle: PabloTextStyle { get }
    
}


