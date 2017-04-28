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
        
    // MARK: - Instance functions
    
    /**
     Creates and returns a new MarkdownTag enum of the same type with specified range.
     
     - parameter range: New range.
     
     - returns: New MarkdownTag enum of the same type with specified range.
     */
    func replacingRange(with range: Range<Index>) -> MarkdownTag {
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
     Returns range that the receiver applies to.
     
     - returns: Range that the receiver applies to.
     */
    func range() -> Range<Index> {
        switch self {
        case .em(let range):
            return range
        case .strong(let range):
            return range
        case .strikethrough(let range):
            return range
        }
    }
    
    /**
     Returns length of the opening tag characters.
     
     - returns: Length of the opening tag characters.
     */
    func openingTagLength() -> Int {
        switch self {
        case .em(_):
            return EmphasisTag.Constants.emTagLength
        case .strong(_):
            return EmphasisTag.Constants.strongTagLength
        case .strikethrough(_):
            return EmphasisTag.Constants.strikethroughTagLength
        }
    }
    
    /**
     Returns length of the closing tag characters.
     
     - returns: Length of the closing tag characters.
     */
    func closingTagLength() -> Int {
        switch self {
        case .em(_):
            return EmphasisTag.Constants.emTagLength
        case .strong(_):
            return EmphasisTag.Constants.strongTagLength
        case .strikethrough(_):
            return EmphasisTag.Constants.strikethroughTagLength
        }
    }
    
}
