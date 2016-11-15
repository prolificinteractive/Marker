//
//  Font.swift
//  Marker
//
//  Created by Htin Linn on 5/12/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

import UIKit

internal protocol Font {
    
    var familyName: String { get }
    
    func regularFont(ofSize size: CGFloat) -> UIFont
    func boldFont(ofSize size: CGFloat) -> UIFont
    func italicFont(ofSize size: CGFloat) -> UIFont
    
}
