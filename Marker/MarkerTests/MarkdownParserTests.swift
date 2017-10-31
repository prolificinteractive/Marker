//
//  MarkdownParserTests.swift
//  Marker
//
//  Created by Htin Linn on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import Marker

class MarkdownParserTests: XCTestCase {
    
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

    func testParseLinkElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("[abc](https://example.com) def")

            XCTAssert(parsedString == "abc def")
            XCTAssert(parsedElements.count == 1)

            XCTAssert(parsedElements[0].isLinkElement())
            XCTAssert(parsedElements[0].linkURLString() == "https://example.com")

            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseMixedElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("*abc* __def__ _ghi_ **jkl** ~~mno~~ ==pqr== [stu](https://vw.com)")
            
            XCTAssert(parsedString == "abc def ghi jkl mno pqr stu")
            XCTAssert(parsedElements.count == 7)
            
            XCTAssert(parsedElements[0].isEmElement())
            XCTAssert(parsedElements[1].isStrongElement())
            XCTAssert(parsedElements[2].isEmElement())
            XCTAssert(parsedElements[3].isStrongElement())
            XCTAssert(parsedElements[4].isStrikethroughElement())
            XCTAssert(parsedElements[5].isUnderlineElement())
            XCTAssert(parsedElements[6].isLinkElement())
            XCTAssert(parsedElements[6].linkURLString() == "https://vw.com")
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "def"))
            XCTAssert(parsedElements[2].range == parsedString.range(of: "ghi"))
            XCTAssert(parsedElements[3].range == parsedString.range(of: "jkl"))
            XCTAssert(parsedElements[4].range == parsedString.range(of: "mno"))
            XCTAssert(parsedElements[5].range == parsedString.range(of: "pqr"))
            XCTAssert(parsedElements[6].range == parsedString.range(of: "stu"))
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

    func testEscapeCharacters() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("\\*em\\* and \\__strong\\__ escaped.")

            XCTAssert(parsedString == "*em* and __strong__ escaped.")
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

    func testThatNonLinkSquareBracketsAreAllowed() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("[self dealloc];")

            XCTAssert(parsedString == "[self dealloc];")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatNonLinkParenthesesAreAllowed() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("there can be one (or more) parentheses(s).")

            XCTAssert(parsedString == "there can be one (or more) parentheses(s).")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatSquareBracketsNeedToBeRightBeforeParenthesesForLinks() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("This is a [link](https://example.com).")

            XCTAssert(parsedString == "This is a link.")
            XCTAssert(parsedElements.count == 1)

            XCTAssert(parsedElements[0].isLinkElement())
            XCTAssert(parsedElements[0].linkURLString() == "https://example.com")
        } catch {
            XCTFail("Parsing failed.")
        }

        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("This is not a [link] (https://example.com).")

            XCTAssert(parsedString == "This is not a [link] (https://example.com).")
            XCTAssert(parsedElements.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatMultipleLinksAreAllowed() {
        do {
            let string = """
                [Link A](https://example.com/a),
                [Link B](https://example.com/b)
                """
            let (parsedString, parsedElements) = try MarkdownParser.parse(string)

            XCTAssert(parsedString == "Link A,\nLink B")
            XCTAssert(parsedElements.count == 2)

            XCTAssert(parsedElements[0].linkURLString() == "https://example.com/a")
            XCTAssert(parsedElements[1].linkURLString() == "https://example.com/b")
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatCharactersWithInURLsCanBeEscaped() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("[Link](https://en.wikipedia.org/wiki/Link_(The_Legend_of_Zelda\\))")

            XCTAssert(parsedString == "Link")
            XCTAssert(parsedElements.count == 1)

            XCTAssert(parsedElements[0].isLinkElement())
            XCTAssert(parsedElements[0].linkURLString() == "https://en.wikipedia.org/wiki/Link_(The_Legend_of_Zelda)")
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatUnclosedTagsThrowAnError() {
        do {
            let _ = try MarkdownParser.parse("Please *don't _do_ this.")
        } catch {
            XCTAssert(error as! TokenParser.Error == TokenParser.Error.unclosedTags)
        }
        
        do {
            let _ = try MarkdownParser.parse("Finish this __sentenc")
        } catch {
            XCTAssert(error as! TokenParser.Error == TokenParser.Error.unclosedTags)
        }
        
        do {
            let _ = try MarkdownParser.parse("Not ==correct.")
        } catch {
            XCTAssert(error as! TokenParser.Error == TokenParser.Error.unclosedTags)
        }

        do {
            let _ = try MarkdownParser.parse("This _won't__ work because the tags don't match.")
        } catch {
            XCTAssert(error as! TokenParser.Error == TokenParser.Error.unclosedTags)
        }

        do {
            let _ = try MarkdownParser.parse("Neither **should* this.")
        } catch {
            XCTAssert(error as! TokenParser.Error == TokenParser.Error.unclosedTags)
        }
    }
    
}

private extension MarkdownElement {
    
    func isEmElement() -> Bool {
        switch self {
        case .em:
            return true
        default:
            return false
        }
    }
    
    func isStrongElement() -> Bool {
        switch self {
        case .strong:
            return true
        default:
            return false
        }
    }
    
    func isStrikethroughElement() -> Bool {
        switch self {
        case .strikethrough:
            return true
        default:
            return false
        }
    }
    
    func isUnderlineElement() -> Bool {
        switch self {
        case .underline:
            return true
        default:
            return false
        }
    }

    func isLinkElement() -> Bool {
        switch self {
        case .link:
            return true
        default:
            return false
        }
    }

    func linkURLString() -> String? {
        switch self {
        case .link(_, let urlString):
            return urlString
        default:
            return nil
        }
    }

}
