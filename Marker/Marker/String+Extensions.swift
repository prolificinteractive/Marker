//
//  String+Extensions.swift
//  Marker
//
//  Created by Htin Linn on 5/8/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

// Source: http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index/30404532#30404532
internal extension String {
    
    /// Returns NSRange from given range.
    ///
    /// - Parameter range: Range.
    /// - Returns: NSRange representation of `range`.
    func range(from range: Range<String.Index>) -> NSRange {
        let from = String.UTF16View.Index(range.lowerBound, within: utf16)
        let to = String.UTF16View.Index(range.upperBound, within: utf16)
        
        return NSRange(location: utf16.distance(from: utf16.startIndex, to: from), length: utf16.distance(from: from, to: to))
    }
    
}
