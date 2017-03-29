import UIKit
import XCTest
@testable import Marker

class ParserTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testParseEmTags() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("*abc* def _ghi_")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedTags.count == 2)
            
            parsedTags.forEach { XCTAssert($0.isEmTag()) }
            
            XCTAssert(parsedTags[0].range() == parsedString.range(of: "abc"))
            XCTAssert(parsedTags[1].range() == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseStrongTags() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("**abc** def __ghi__")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedTags.count == 2)
            
            parsedTags.forEach { XCTAssert($0.isStrongTag()) }
            
            XCTAssert(parsedTags[0].range() == parsedString.range(of: "abc"))
            XCTAssert(parsedTags[1].range() == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseStrikeThroughTags() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("~~abc~~ def ~~ghi~~")
            
            XCTAssert(parsedString == "abc def ghi")
            XCTAssert(parsedTags.count == 2)
            
            parsedTags.forEach { XCTAssert($0.isStrikeThoughTag()) }
            
            XCTAssert(parsedTags[0].range() == parsedString.range(of: "abc"))
            XCTAssert(parsedTags[1].range() == parsedString.range(of: "ghi"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testParseMixedTags() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("*abc* __def__ _ghi_ **jkl** ~~mno~~")
            
            XCTAssert(parsedString == "abc def ghi jkl mno")
            XCTAssert(parsedTags.count == 5)
            
            XCTAssert(parsedTags[0].isEmTag())
            XCTAssert(parsedTags[1].isStrongTag())
            XCTAssert(parsedTags[2].isEmTag())
            XCTAssert(parsedTags[3].isStrongTag())
            XCTAssert(parsedTags[4].isStrikeThoughTag())
            
            XCTAssert(parsedTags[0].range() == parsedString.range(of: "abc"))
            XCTAssert(parsedTags[1].range() == parsedString.range(of: "def"))
            XCTAssert(parsedTags[2].range() == parsedString.range(of: "ghi"))
            XCTAssert(parsedTags[3].range() == parsedString.range(of: "jkl"))
            XCTAssert(parsedTags[4].range() == parsedString.range(of: "mno"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralAsterisk() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("a * b * c = d")
            
            XCTAssert(parsedString == "a * b * c = d")
            XCTAssert(parsedTags.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralUnderscore() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("< ( ^ _ ^ < )")
            
            XCTAssert(parsedString == "< ( ^ _ ^ < )")
            XCTAssert(parsedTags.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testLiteralTilde() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("appox. ~9000")
            
            XCTAssert(parsedString == "appox. ~9000")
            XCTAssert(parsedTags.count == 0)
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testTagsInMiddleOfWords() {
        do {
            let (parsedString, parsedTags) = try MarkdownParser.parse("the_quick_brown*fox*jumps__over__the**lazy**dog.")
            
            XCTAssert(parsedString == "thequickbrownfoxjumpsoverthelazydog.")
            XCTAssert(parsedTags.count == 4)
            
            XCTAssert(parsedTags[0].isEmTag())
            XCTAssert(parsedTags[1].isEmTag())
            XCTAssert(parsedTags[2].isStrongTag())
            XCTAssert(parsedTags[3].isStrongTag())
            
            XCTAssert(parsedTags[0].range() == parsedString.range(of: "quick"))
            XCTAssert(parsedTags[1].range() == parsedString.range(of: "fox"))
            XCTAssert(parsedTags[2].range() == parsedString.range(of: "over"))
            XCTAssert(parsedTags[3].range() == parsedString.range(of: "lazy"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }
    
    func testThatMismatchedTagsThrowAnError() {
        do {
            let _ = try MarkdownParser.parse("This _won't__ work because the tags don't match.")
        } catch {
            XCTAssert(error as! MarkdownTag.ParserError == MarkdownTag.ParserError.tagMismatch)
        }
        
        do {
            let _ = try MarkdownParser.parse("Neither **should* this.")
        } catch {
            XCTAssert(error as! MarkdownTag.ParserError == MarkdownTag.ParserError.tagMismatch)
        }
    }
    
    func testThatUnclosedTagsThrowAnError() {
        do {
            let _ = try MarkdownParser.parse("Please *don't _do_ this.")
        } catch {
            XCTAssert(error as! MarkdownTag.ParserError == MarkdownTag.ParserError.unclosedTags)
        }
        
        do {
            let _ = try MarkdownParser.parse("Finish this __sentenc")
        } catch {
            XCTAssert(error as! MarkdownTag.ParserError == MarkdownTag.ParserError.unclosedTags)
        }
    }
    
}

private extension MarkdownTag {
    
    func isEmTag() -> Bool {
        switch self {
        case .em(_):
            return true
        default:
            return false
        }
    }
    
    func isStrongTag() -> Bool {
        switch self {
        case .strong(_):
            return true
        default:
            return false
        }
    }
    
    func isStrikeThoughTag() -> Bool {
        switch self {
        case .strikeThough(_):
            return true
        default:
            return false
        }
    }
    
}
