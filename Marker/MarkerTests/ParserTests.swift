//
//  ParserTests.swift
//  Marker
//
//  Created by Htin Linn on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import Marker

class ParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseEmElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("*abc* def _ghi_")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedElements.count == 2)
            
            parsedElements.forEach { XCTAssert($0.isEmElement()) }
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseStrongElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("**abc** def __ghi__")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedElements.count == 2)
            
            parsedElements.forEach { XCTAssert($0.isStrongElement()) }
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseStrikethroughElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("~~abc~~ def ~~ghi~~")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedElements.count == 2)
            
            parsedElements.forEach { XCTAssert($0.isStrikethroughElement()) }
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseUnderlinedElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("==abc== def ==ghi==")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedElements.count == 2)
            
            parsedElements.forEach { XCTAssert($0.isUnderlineElement()) }
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseMixedElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("*abc* __def__ _ghi_ **jkl** ~~mno~~ ==pqr==")
            
            XCTAssert(parsedString == "abc def ghi jkl mno pqr")
            XCTAssert(parsedElements.count == 6)
            
            XCTAssert(parsedElements[0].isEmElement())
            XCTAssert(parsedElements[1].isStrongElement())
            XCTAssert(parsedElements[2].isEmElement())
            XCTAssert(parsedElements[3].isStrongElement())
            XCTAssert(parsedElements[4].isStrikethroughElement())
            XCTAssert(parsedElements[5].isUnderlineElement())
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "def"))
            XCTAssert(parsedElements[2].range == parsedString.range(of: "ghi"))
            XCTAssert(parsedElements[3].range == parsedString.range(of: "jkl"))
            XCTAssert(parsedElements[4].range == parsedString.range(of: "mno"))
            XCTAssert(parsedElements[5].range == parsedString.range(of: "pqr"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralAsterisk() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("a * b * c = d")
            
            XCTAssert(parsedString == "a * b * c = d")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralUnderscore() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("< ( ^ _ ^ < )")
            
            XCTAssert(parsedString == "< ( ^ _ ^ < )")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralTilde() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("appox. ~9000")
            
            XCTAssert(parsedString == "appox. ~9000")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralEqual() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("two + two = four")
            
            XCTAssert(parsedString == "two + two = four")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testElementsInMiddleOfWords() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("the_quick_brown*fox*jumps__over__the**lazy**==dog==.")
            
            XCTAssert(parsedString == "thequickbrownfoxjumpsoverthelazydog.")
            XCTAssert(parsedElements.count == 5)
            
            XCTAssert(parsedElements[0].isEmElement())
            XCTAssert(parsedElements[1].isEmElement())
            XCTAssert(parsedElements[2].isStrongElement())
            XCTAssert(parsedElements[3].isStrongElement())
            XCTAssert(parsedElements[4].isUnderlineElement())
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "quick"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "fox"))
            XCTAssert(parsedElements[2].range == parsedString.range(of: "over"))
            XCTAssert(parsedElements[3].range == parsedString.range(of: "lazy"))
            XCTAssert(parsedElements[4].range == parsedString.range(of: "dog"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testThatMismatchedTagsThrowAnError() {
        do {
            let _ = try MarkdownParser.parse("This _won't__ work because the tags don't match.")
        } catch {
            XCTAssert(error as! ElementParser.ParserError == ElementParser.ParserError.tagMismatch)
        }
        
        do {
            let _ = try MarkdownParser.parse("Neither **should* this.")
        } catch {
            XCTAssert(error as! ElementParser.ParserError == ElementParser.ParserError.tagMismatch)
        }
    }
    
    func testThatUnclosedTagsThrowAnError() {
        do {
            let _ = try MarkdownParser.parse("Please *don't _do_ this.")
        } catch {
            XCTAssert(error as! ElementParser.ParserError == ElementParser.ParserError.unclosedTags)
        }
        
        do {
            let _ = try MarkdownParser.parse("Finish this __sentenc")
        } catch {
            XCTAssert(error as! ElementParser.ParserError == ElementParser.ParserError.unclosedTags)
        }
        
        do {
            let _ = try MarkdownParser.parse("Not ==correct.")
        } catch {
            XCTAssert(error as! ElementParser.ParserError == ElementParser.ParserError.unclosedTags)
        }
    }
    
}

private extension MarkdownElement {
    
    func isEmElement() -> Bool {
        switch self {
        case .em(_):
            return true
        default:
            return false
        }
    }
    
    func isStrongElement() -> Bool {
        switch self {
        case .strong(_):
            return true
        default:
            return false
        }
    }
    
    func isStrikethroughElement() -> Bool {
        switch self {
        case .strikethrough(_):
            return true
        default:
            return false
        }
    }
    
    func isUnderlineElement() -> Bool {
        switch self {
        case .underline(_):
            return true
        default:
            return false
        }
    }
    
}
