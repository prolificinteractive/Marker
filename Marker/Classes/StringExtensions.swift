//
//  StringExtensions.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

// Source: http://stackoverflow.com/questions/25138339/nsrange-to-rangestring-index/30404532#30404532
internal extension String {
    
    func NSRangeFromRange(range: Range<String.Index>) -> NSRange {
        let from = String.UTF16View.Index(range.startIndex, within: utf16)
        let to = String.UTF16View.Index(range.endIndex, within: utf16)
        
        return NSRange(location: utf16.startIndex.distanceTo(from), length: from.distanceTo(to))
    }
    
}