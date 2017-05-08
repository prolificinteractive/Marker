//
//  Symbol.swift
//  Marker
//
//  Created by Htin Linn on 4/28/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

/// A `Symbol` is a one or two character `String` used for marking up text.
internal struct Symbol: RawRepresentable, Equatable {
    
    typealias RawValue = String
    
    /// Underlying `String` representation.
    let rawValue: String
    
    /// Length of the symbol.
    var length: Int {
        return rawValue.characters.count
    }
    
    // MARK: - Init/deinit
    
    /// Creates a new instance with the specified raw value.
    ///
    /// If the character count of the `rawValue` isn't either one or zero, this intializer returns `nil`.
    ///
    /// - Parameter rawValue: The raw value to use for the new instance.
    /// - Returns: A new `Symbol` instance.
    init?(rawValue: String) {
        guard rawValue.characters.count > 0 || rawValue.characters.count <= 2 else {
            return nil
        }
        
        self.rawValue = rawValue
    }
    
    // MARK: - Instance functions

    /// Returns a boolean indicating whether the symbol matches given characters.
    /// This function currently requires three characters. 
    /// Preceding and succeeding characters are used to check if the matched character is surrounded by a space.
    /// Succeeding character is also used to matching two character symbols.
    ///
    /// - Parameters:
    ///   - precedingCharacter: Character preceding the character to match.
    ///   - character: Character to match.
    ///   - succeedingCharacter: Character succeeding the chracter to match.
    /// - Returns: Boolean indicating whether the symbol matches given characters.
    func matches(precedingCharacter: Character?, character: Character?, succeedingCharacter: Character?) -> Bool {
        guard let symbolCharacterOne = rawValue.characters.first else {
            return false
        }

        if length == 1 {
            switch (precedingCharacter, character, succeedingCharacter) {
            case (.some(" "), .some(symbolCharacterOne), .some(" ")):
                // If the symbol is only one character and is surrounded by empty spaces, treat it like a literal.
                return false
            case (_, .some(symbolCharacterOne), _):
                return true
            default:
                break
            }
        } else if length == 2 {
            let symbolCharacterTwo = rawValue[rawValue.characters.index(after: rawValue.startIndex)]
            
            switch (precedingCharacter, character, succeedingCharacter) {
            case (_, .some(symbolCharacterOne), .some(symbolCharacterTwo)):
                return true
            default:
                break
            }
        }
        
        return false
    }
    
}
