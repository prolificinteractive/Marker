//
//  FontTheme.swift
//  Marker-Example
//
//  Created by Michael Campbell on 5/24/17.
//
//

import Marker

internal protocol FontTheme {

    var headlineTextStyle: TextStyle { get }
    var titleTextStyle: TextStyle { get }
    var bodyTextStyle: TextStyle { get }

    var headlineFontSize: CGFloat { get }
    var titleFontSize: CGFloat { get }

}

extension FontTheme {

    var headlineFontSize: CGFloat {
        return 17
    }

    var titleFontSize: CGFloat {
        return 19
    }
    
}
