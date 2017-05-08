//
//  MarkdownTag.swift
//  Marker
//
//  Created by Htin Linn on 5/11/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

internal typealias Index = String.CharacterView.Index

/**
 Markdown tag.
 
 - em:              Em tag.
 - strong:          Strong tag.
 - strikethrough:   Strikethrough tag.
 */
internal enum MarkdownTag {
    
    case em(Range<Index>)
    case strong(Range<Index>)
    case strikethrough(Range<Index>)
    
    /// Range of the tag.
    var range: Range<Index> {
        switch self {
        case .em(let range):
            return range
        case .strong(let range):
            return range
        case .strikethrough(let range):
            return range
        }
    }
    
    // MARK: - Instance functions
    
    /// Returns a corresponding Markdown element with given range.
    ///
    /// - Parameter range: Range.
    /// - Returns: Markdown element.
    func element(with range: Range<Index>) -> MarkdownElement {
        switch self {
        case .em(_):
            return .em(range)
        case .strong(_):
            return .strong(range)
        case .strikethrough(_):
            return .strikethrough(range)
        }
    }
    
    /**
     Returns length of the opening tag characters.
     
     - returns: Length of the opening tag characters.
     */
    func openingTagLength() -> Int {
        switch self {
        case .em(_):
            return 1
        case .strong(_):
            return 2
        case .strikethrough(_):
            return 2
        }
    }
    
    /**
     Returns length of the closing tag characters.
     
     - returns: Length of the closing tag characters.
     */
    func closingTagLength() -> Int {
        switch self {
        case .em(_):
            return 1
        case .strong(_):
            return 2
        case .strikethrough(_):
            return 2
        }
    }
    
}
