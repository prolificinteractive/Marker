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
        
    // MARK: - Static functions
    
    /**
     Parses a given string for Markdown tags.
     
     - parameter string: string to be parsed.
     
     - returns: Tuple containing string stripped of tags and an array of tags.
     */
    static func parseString(string: String) throws -> (strippedString: String, tags: [MarkdownTag]) {
        let tags = try MarkdownTag.parseString(string)
        
        guard tags.count > 0 else {
            return (string, [])
        }
        
        var strippedString = string.substringWithRange(string.startIndex..<tags[0].range().startIndex)
        var strippedTags: [MarkdownTag] = []
        
        // Construct a new string without the markdown tags by using the original string and list of tags.
        for i in 0..<tags.count {
            let tag = tags[i]
            
            let openingIndex = strippedString.endIndex
            // Add the text that is in between the opening and closing tags to the new string.
            strippedString += string.substringWithRange(tag.range().startIndex.advancedBy(tag.openingTagLength())..<tag.range().endIndex)
            let closingIndex = strippedString.endIndex
            
            // Create a tag that would apply to the stripped out string.
            let strippedTag = tag.tagWithRange(openingIndex..<closingIndex)
            strippedTags.append(strippedTag)
            
            // If there is text between the current tag and the next tag or the end of string, add it to the new string.
            var nextIndex: Index
            if i + 1 < tags.count {
                let nextTag = tags[i + 1]
                nextIndex = nextTag.range().startIndex
            } else {
                nextIndex = string.endIndex
            }
            strippedString += string.substringWithRange(tag.range().endIndex.advancedBy(tag.closingTagLength())..<nextIndex)
        }
        
        return (strippedString, strippedTags)
    }
    
}
