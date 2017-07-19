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
    
    func testParseStrikeThroughElements() {
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
    
    func testParseMixedElements() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("*abc* __def__ _ghi_ **jkl** ~~mno~~")
            
            XCTAssert(parsedString == "abc def ghi jkl mno")
            XCTAssert(parsedElements.count == 5)
            
            XCTAssert(parsedElements[0].isEmElement())
            XCTAssert(parsedElements[1].isStrongElement())
            XCTAssert(parsedElements[2].isEmElement())
            XCTAssert(parsedElements[3].isStrongElement())
            XCTAssert(parsedElements[4].isStrikethroughElement())
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "def"))
            XCTAssert(parsedElements[2].range == parsedString.range(of: "ghi"))
            XCTAssert(parsedElements[3].range == parsedString.range(of: "jkl"))
            XCTAssert(parsedElements[4].range == parsedString.range(of: "mno"))
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
    
    func testElementsInMiddleOfWords() {
        do {
            let (parsedString, parsedElements) = try MarkdownParser.parse("the_quick_brown*fox*jumps__over__the**lazy**dog.")
            
            XCTAssert(parsedString == "thequickbrownfoxjumpsoverthelazydog.")
            XCTAssert(parsedElements.count == 4)
            
            XCTAssert(parsedElements[0].isEmElement())
            XCTAssert(parsedElements[1].isEmElement())
            XCTAssert(parsedElements[2].isStrongElement())
            XCTAssert(parsedElements[3].isStrongElement())
            
            XCTAssert(parsedElements[0].range == parsedString.range(of: "quick"))
            XCTAssert(parsedElements[1].range == parsedString.range(of: "fox"))
            XCTAssert(parsedElements[2].range == parsedString.range(of: "over"))
            XCTAssert(parsedElements[3].range == parsedString.range(of: "lazy"))
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
    
}
