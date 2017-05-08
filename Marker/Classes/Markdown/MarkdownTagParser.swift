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
     
     - tagMismatch:  Opening tag doesn't match closing tag.
     - unclosedTags: A tag was left unclosed.
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
        guard
            let underscoreEmSymbol = Symbol(rawValue: "_"),
            let asteriskEmSymbol = Symbol(rawValue: "*"),
            let underscoreStrongSymbol = Symbol(rawValue: "__"),
            let asteriskStrongSymbol = Symbol(rawValue: "**"),
            let tildeStrikethroughSymbol = Symbol(rawValue: "~~") else {
                return []
        }
        
        let symbols = [underscoreEmSymbol,
                       asteriskEmSymbol,
                       underscoreStrongSymbol,
                       asteriskStrongSymbol,
                       tildeStrikethroughSymbol]
        
        let parser = TagParser(symbols: symbols)
        let tags = parser.parse(string)
        
        guard tags.count % 2 == 0 else {
            throw ParserError.unclosedTags
        }
        
        var markdownTags: [MarkdownTag] = []
        for i in stride(from: 0, to: tags.count, by: 2) {
            let openingTag = tags[i]
            let closingTag = tags[i+1]
            
            switch (openingTag.symbol, closingTag.symbol) {
            case (underscoreEmSymbol, underscoreEmSymbol), (asteriskEmSymbol, asteriskEmSymbol):
                markdownTags.append(.em(openingTag.index..<closingTag.index))
            case (underscoreStrongSymbol, underscoreStrongSymbol), (asteriskStrongSymbol, asteriskStrongSymbol):
                markdownTags.append(.strong(openingTag.index..<closingTag.index))
            case (tildeStrikethroughSymbol, tildeStrikethroughSymbol):
                markdownTags.append(.strikethrough(openingTag.index..<closingTag.index))
            default:
                throw ParserError.tagMismatch
            }
        }
        
        return markdownTags
    }
    
}
