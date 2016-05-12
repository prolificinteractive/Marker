//
//  MarkdownTag.swift
//  Marker
//
//  Created by Htin Linn on 5/11/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

internal typealias Index = String.CharacterView.Index

/**
 Tags used when styling Markdown text.
 
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
    enum Error: ErrorType {
        case TagMismatch
        case UnclosedTags
    }
    
    // MARK: - Static functions
    
    static func parseString(string: String) throws -> [MarkdownTag] {
        let emphasisTags = try parseEmphasisTagsFromString(string)
        return emphasisTags
    }
    
    // MARK: - Instance functions
    
    func tagWithRange(range: Range<Index>) -> MarkdownTag {
        switch self {
        case .Em(_):
            return .Em(range)
        case .Strong(_):
            return .Strong(range)
        }
    }
    
    func range() -> Range<Index> {
        switch self {
        case .Em(let range):
            return range
        case .Strong(let range):
            return range
        }
    }
    
    func openingTagLength() -> Int {
        switch self {
        case .Em(_):
            return EmphasisTag.Constants.EmTagLength
        case .Strong(_):
            return EmphasisTag.Constants.StrongTagLength
        }
    }
    
    func closingTagLength() -> Int {
        switch self {
        case .Em(_):
            return EmphasisTag.Constants.EmTagLength
        case .Strong(_):
            return EmphasisTag.Constants.StrongTagLength
        }
    }
    
    // MARK: - Private functions
    
    private static func parseEmphasisTagsFromString(string: String) throws -> [MarkdownTag] {
        let emphasisTags = EmphasisTag.parseString(string)
        
        guard emphasisTags.count % 2 == 0 else {
            throw Error.UnclosedTags
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
                throw Error.TagMismatch
            }
            
        }
        
        return tags
    }
    
}

// MARK: - EmphasisTag

private enum EmphasisTag {
    
    case AsteriskEm(Index)
    case UnderscoreEm(Index)
    case AsteriskStrong(Index)
    case UnderscoreStrong(Index)
    
    struct Constants {
        static let EmTagLength = 1
        static let StrongTagLength = 2
    }
    
    static func parseString(string: String) -> [EmphasisTag] {
        var emphasisTags: [EmphasisTag] = []
        
        var i = 0
        var advanceBy = 0
        var previousIndex = string.startIndex
        
        while i < string.characters.count {
            let index = previousIndex.advancedBy(advanceBy)
            
            let character: Character? = string[index]
            let precedingCharacter: Character? = (i > 0) ? string[index.predecessor()] : nil
            let succedingCharacter: Character? = (i + 1 < string.characters.count) ? string[index.successor()] : nil
            
            switch (precedingCharacter, character, succedingCharacter) {
            case (.Some(" "), .Some("*"), .Some(" ")), (.Some(" "), .Some("_"), .Some(" ")):
                advanceBy = 1
            case (_, .Some("*"), .Some("*")):
                emphasisTags.append(.AsteriskStrong(index))
                advanceBy = Constants.StrongTagLength
            case (_, .Some("_"), .Some("_")):
                emphasisTags.append(.UnderscoreStrong(index))
                advanceBy = Constants.StrongTagLength
            case (_, .Some("*"), _):
                emphasisTags.append(.AsteriskEm(index))
                advanceBy = Constants.EmTagLength
            case (_, .Some("_"), _):
                emphasisTags.append(.UnderscoreEm(index))
                advanceBy = Constants.EmTagLength
            default:
                advanceBy = 1
            }
            
            i = i + advanceBy
            previousIndex = index
        }
        
        return emphasisTags
    }
    
}
