//
//  EmphasisTag.swift
//  Marker
//
//  Created by Htin Linn on 5/11/16.
//  Copyright © 2016 Prolific Interactive. All rights reserved.
//

/**
 Emphasis tag.
 
 - AsteriskEm:       Em tag denoted with an asterisk.
 - UnderscoreEm:     Em tag denoted with an underscore.
 - AsteriskStrong:   Strong tag denoted with an asterisk.
 - UnderscoreStrong: Strong tag denoted with an underscore.
 */
internal enum EmphasisTag {
    
    case AsteriskEm(Index)
    case UnderscoreEm(Index)
    case AsteriskStrong(Index)
    case UnderscoreStrong(Index)
    
    /**
     *  Emphasis tag constants.
     */
    struct Constants {
        static let EmTagLength = 1
        static let StrongTagLength = 2
    }
    
    /**
     *  Emphasis tag parser.
     */
    struct Parser {
        
        /**
         Parses and returns an array of emphasis tags.
         
         - parameter string: String to be parsed.
         
         - returns: Array of emphasis tags.
         */
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
    
}