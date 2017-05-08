//
//  MarkdownParser.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

/// Simple bare-bones markdown parser.
internal struct MarkdownParser {
    
    /// Parser error.
    ///
    /// - tagMismatch: Opening tag doesn't match closing tag.
    /// - unclosedTags: A tag was left unclosed.
    enum ParserError: Error {
        case invalidTagSymbol
    }
    
    // MARK: - Static functions
    
    /// Parses specified string and returns a tuple containing string stripped of tag characters and an array of Markdown elements.
    ///
    /// - Parameter string: String to be parsed.
    /// - Returns: Tuple containing string stripped of tag characters and an array of Markdown elements.
    /// - Throws: Parser error.
    static func parse(_ string: String) throws -> (strippedString: String, elements: [MarkdownElement]) {
        guard
            let underscoreEmSymbol = Symbol(rawValue: "_"),
            let asteriskEmSymbol = Symbol(rawValue: "*"),
            let underscoreStrongSymbol = Symbol(rawValue: "__"),
            let asteriskStrongSymbol = Symbol(rawValue: "**"),
            let tildeStrikethroughSymbol = Symbol(rawValue: "~~") else {
                return (string, [])
        }
        
        func transformToMarkdownElement(_ element: Element) throws -> MarkdownElement {
            switch element.symbol {
            case underscoreEmSymbol, asteriskEmSymbol:
                return .em(element.range)
            case underscoreStrongSymbol, asteriskStrongSymbol:
                return .strong(element.range)
            case tildeStrikethroughSymbol:
                return .strikethrough(element.range)
            default:
                throw ParserError.invalidTagSymbol
            }
        }
        
        let (strippedString, elements) = try ElementParser.parse(string,
                                                                 for: [underscoreEmSymbol,
                                                                       asteriskEmSymbol,
                                                                       underscoreStrongSymbol,
                                                                       asteriskStrongSymbol,
                                                                       tildeStrikethroughSymbol])
        return try (strippedString, elements.map(transformToMarkdownElement))
    }
    
}
