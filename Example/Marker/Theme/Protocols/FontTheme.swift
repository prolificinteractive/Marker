//
//  FontTheme.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol FontTheme {
    
    var coverTextStyle: MarkerExampleTextStyle { get }
    var bodyTextStyle: MarkerExampleTextStyle { get }
    var captionTextStyle: MarkerExampleTextStyle { get }
    
}


