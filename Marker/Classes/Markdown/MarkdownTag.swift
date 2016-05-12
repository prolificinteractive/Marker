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
 
 - Em:     Em tag.
 - Strong: Strong tag.
 */
internal enum MarkdownTag {
    
    case Em(Range<Index>)
    case Strong(Range<Index>)
    
    /**
     Parser error.
     
     - TagMismatch:  Opening tag doesn't match closing tag.
     - UnclosedTags: A tag was left unclosed.
     */
    enum ParserError: ErrorType {
        case TagMismatch
        case UnclosedTags
    }
    
    /**
     *  Markdown tag parser.
     */
    struct Parser {
        
        static func parseString(string: String) throws -> [MarkdownTag] {
            let emphasisTags = try parseEmphasisTagsFromString(string)
            return emphasisTags
        }
        
        // MARK: - Private functions
        
        /**
         Parses and converts emphasis tags into Markdown tags.
         
         - parameter string: String to be parsed.
         
         - throws: Parser error.
         
         - returns: Array of Markdown tags.
         */
        private static func parseEmphasisTagsFromString(string: String) throws -> [MarkdownTag] {
            let emphasisTags = EmphasisTag.Parser.parseString(string)
            
            guard emphasisTags.count % 2 == 0 else {
                throw ParserError.UnclosedTags
            }
            
            var tags: [MarkdownTag] = []
            for i in 0.stride(to: emphasisTags.count, by: 2) {
                let openingTag = emphasisTags[i]
                let closingTag = emphasisTags[i+1]
                
                switch (openingTag, closingTag) {
                case let (.AsteriskEm(openingIndex), .AsteriskEm(closingIndex)):
                    tags.append(.Em(openingIndex..<closingIndex))
                case let (.UnderscoreEm(openingIndex), .UnderscoreEm(closingIndex)):
                    tags.append(.Em(openingIndex..<closingIndex))
                case let (.AsteriskStrong(openingIndex), .AsteriskStrong(closingIndex)):
                    tags.append(.Strong(openingIndex..<closingIndex))
                case let (.UnderscoreStrong(openingIndex), .UnderscoreStrong(closingIndex)):
                    tags.append(.Strong(openingIndex..<closingIndex))
                default:
                    throw ParserError.TagMismatch
                }
                
            }
            
            return tags
        }
        
    }
    
    // MARK: - Instance functions
    
    /**
     Creates and returns a new MarkdownTag enum of the same type with specified range.
     
     - parameter range: New range.
     
     - returns: New MarkdownTag enum of the same type with specified range.
     */
    func tagWithRange(range: Range<Index>) -> MarkdownTag {
        switch self {
        case .Em(_):
            return .Em(range)
        case .Strong(_):
            return .Strong(range)
        }
    }
    
    /**
     Returns range that the receiver applies to.
     
     - returns: Range that the receiver applies to.
     */
    func range() -> Range<Index> {
        switch self {
        case .Em(let range):
            return range
        case .Strong(let range):
            return range
        }
    }
    
    /**
     Returns length of the opening tag characters.
     
     - returns: Length of the opening tag characters.
     */
    func openingTagLength() -> Int {
        switch self {
        case .Em(_):
            return EmphasisTag.Constants.EmTagLength
        case .Strong(_):
            return EmphasisTag.Constants.StrongTagLength
        }
    }
    
    /**
     Returns length of the closing tag characters.
     
     - returns: Length of the closing tag characters.
     */
    func closingTagLength() -> Int {
        switch self {
        case .Em(_):
            return EmphasisTag.Constants.EmTagLength
        case .Strong(_):
            return EmphasisTag.Constants.StrongTagLength
        }
    }
    
}
