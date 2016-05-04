//
//  MarkdownParser.swift
//  Marker
//
//  Created by Htin Linn on 5/4/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

/**
 *  Simple bare-bones markdown parser.
 */
internal struct MarkdownParser {
    
    enum Error: ErrorType {
        case TagMismatch
        case UnclosedTags
    }
    
    typealias Index = String.CharacterView.Index
    
    /**
     Tags used when styling Markdown text.
     
     - Em:     Emphasis tag. Rendered as italic.
     - Strong: Strong tag. Rendered as bold.
     */
    enum Tag {
        case Em(Range<Index>)
        case Strong(Range<Index>)
        
        /**
         Returns range associated with the receiver.
         
         - returns: Range of text where the tag applies.
         */
        func range() -> Range<Index> {
            switch self {
            case .Em(let range):
                return range
            case .Strong(let range):
                return range
            }
        }
        
        private static func parseTagsFromString(string: String) throws -> [Tag] {
            let halfTags = HalfTag.parseHalfTagsFromString(string)
            
            guard halfTags.count % 2 == 0 else {
                throw Error.UnclosedTags
            }
            
            var tags: [Tag] = []
            for i in 0.stride(to: halfTags.count, by: 2) {
                let openingTag = halfTags[i]
                let closingTag = halfTags[i+1]
                
                switch (openingTag, closingTag) {
                case (.Em(let openingIndex), .Em(let closingIndex)):
                    tags.append(.Em(openingIndex..<closingIndex))
                case (.Strong(let openingIndex), .Strong(let closingIndex)):
                    tags.append(.Strong(openingIndex..<closingIndex))
                default:
                    throw Error.TagMismatch
                }
                
            }
            
            return tags
        }
        
        private func setRange(range: Range<Index>) -> Tag {
            switch self {
            case .Em(_):
                return .Em(range)
            case .Strong(_):
                return .Strong(range)
            }
        }
        
        private func halfTagLength() -> Int {
            switch self {
            case .Em(_):
                return 1
            case .Strong(_):
                return 2
            }
        }
        
    }
    
    private enum HalfTag {
        case Em(Index)
        case Strong(Index)
        
        static func parseHalfTagsFromString(string: String) -> [HalfTag] {
            var halfTags: [HalfTag] = []
            
            var i = 0
            while i < string.characters.count {
                let currentIndex = string.startIndex.advancedBy(i)
                let nextIndexExists = i + 1 < string.characters.count
                
                if string[currentIndex] == "_" {
                    if nextIndexExists {
                        let nextIndex = currentIndex.advancedBy(1)
                        
                        if string[nextIndex] == "_" {
                            halfTags.append(.Strong(currentIndex))
                            
                            i  = i + 2
                            continue
                        }
                    }
                    
                    halfTags.append(.Em(currentIndex))
                }
                
                i = i + 1
            }
            
            return halfTags
        }
    }
    
    // MARK: - Static functions
    
    /**
     Parses a given string for Markdown tags.
     
     - parameter string: string to be parsed.
     
     - returns: Tuple containing string stripped of tags and an array of tags.
     */
    static func parseString(string: String) throws -> (strippedString: String, tags: [Tag]) {
        let tags = try Tag.parseTagsFromString(string)
        
        guard tags.count > 0 else {
            return (string, [])
        }
        
        var strippedString = string.substringWithRange(string.startIndex..<tags[0].range().startIndex)
        var strippedTags: [Tag] = []
        
        // Construct a new string without the markdown tags by using the original string and list of tags.
        for i in 0..<tags.count {
            let tag = tags[i]
            
            let openingIndex = strippedString.endIndex
            // Add the text that is in between the opening and closing tags to the new string.
            strippedString += string.substringWithRange(tag.range().startIndex.advancedBy(tag.halfTagLength())..<tag.range().endIndex)
            let closingIndex = strippedString.endIndex
            
            // Create a tag that would apply to the stripped out string.
            let strippedTag = tag.setRange(openingIndex..<closingIndex)
            strippedTags.append(strippedTag)
            
            // If there is text between the current tag and the next tag or the end of string, add it to the new string.
            var nextIndex: Index
            if i + 1 < tags.count {
                let nextTag = tags[i + 1]
                nextIndex = nextTag.range().startIndex
            } else {
                nextIndex = string.endIndex
            }
            strippedString += string.substringWithRange(tag.range().endIndex.advancedBy(tag.halfTagLength())..<nextIndex)
        }
        
        return (strippedString, strippedTags)
    }
    
}
