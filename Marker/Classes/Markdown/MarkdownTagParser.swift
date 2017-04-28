//
//  MarkdownTagParser.swift
//  Marker
//
//  Created by Htin Linn on 4/28/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/**
 *  Markdown tag parser.
 */
internal struct MarkdownTagParser {
    
    /**
     Parser error.
     
     - TagMismatch:  Opening tag doesn't match closing tag.
     - UnclosedTags: A tag was left unclosed.
     */
    enum ParserError: Error {
        case tagMismatch
        case unclosedTags
    }
    
    /**
     Parses and converts emphasis tags into Markdown tags.
     
     - parameter string: String to be parsed.
     
     - throws: Parser error.
     
     - returns: Array of Markdown tags.
     */
    static func parse(_ string: String) throws -> [MarkdownTag] {
        let emphasisTags = try parseEmphasisTags(string)
        return emphasisTags
    }
    
    // MARK: - Private functions
    
    private static func parseEmphasisTags(_ string: String) throws -> [MarkdownTag] {
        let emphasisTags = EmphasisTag.Parser.parse(string)
        
        guard emphasisTags.count % 2 == 0 else {
            throw ParserError.unclosedTags
        }
        
        var tags: [MarkdownTag] = []
        for i in stride(from: 0, to: emphasisTags.count, by: 2) {
            let openingTag = emphasisTags[i]
            let closingTag = emphasisTags[i+1]
            
            switch (openingTag, closingTag) {
            case let (.asteriskEm(openingIndex), .asteriskEm(closingIndex)):
                tags.append(.em(openingIndex..<closingIndex))
            case let (.underscoreEm(openingIndex), .underscoreEm(closingIndex)):
                tags.append(.em(openingIndex..<closingIndex))
            case let (.asteriskStrong(openingIndex), .asteriskStrong(closingIndex)):
                tags.append(.strong(openingIndex..<closingIndex))
            case let (.underscoreStrong(openingIndex), .underscoreStrong(closingIndex)):
                tags.append(.strong(openingIndex..<closingIndex))
            case let (.tildeStrikethrough(openingIndex), .tildeStrikethrough(closingIndex)):
                tags.append(.strikethrough(openingIndex..<closingIndex))
            default:
                throw ParserError.tagMismatch
            }
            
        }
        
        return tags
    }
    
}
