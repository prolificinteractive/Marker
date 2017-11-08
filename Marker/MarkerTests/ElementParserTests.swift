//
//  ElementParserTests.swift
//  Marker
//
//  Created by Htin Linn on 10/31/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import Marker

class ElementParserTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testParseMatchingSymbolElements() {
        do {
            let poundRule = Rule(symbol: Symbol(character: "#"))
            let dollarRule = Rule(symbol: Symbol(character: "$"))

            let (parsedString, parsedElements) = try ElementParser.parse("#abc# def $ghi$ jkl $mno$",
                                                                         using: [poundRule, dollarRule])

            XCTAssert(parsedString == "abc def ghi jkl mno")
            XCTAssert(parsedElements.count == 3)

            XCTAssert(parsedElements[0].rule == poundRule)
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))

            XCTAssert(parsedElements[1].rule == dollarRule)
            XCTAssert(parsedElements[1].range == parsedString.range(of: "ghi"))

            XCTAssert(parsedElements[2].rule == dollarRule)
            XCTAssert(parsedElements[2].range == parsedString.range(of: "mno"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testParseNonMatchingSymbolElements() {
        do {
            let curlyBracketRule = Rule(openingSymbol: Symbol(character: "{"), closingSymbol: Symbol(character: "}"))
            let angleBracketRule = Rule(openingSymbol: Symbol(character: "<"), closingSymbol: Symbol(character: ">"))

            let (parsedString, parsedElements) = try ElementParser.parse("Here is a <tag> and a {block}.",
                                                                         using: [curlyBracketRule, angleBracketRule])

            XCTAssert(parsedString == "Here is a tag and a block.")
            XCTAssert(parsedElements.count == 2)

            XCTAssert(parsedElements[0].rule == angleBracketRule)
            XCTAssert(parsedElements[0].range == parsedString.range(of: "tag"))

            XCTAssert(parsedElements[1].rule == curlyBracketRule)
            XCTAssert(parsedElements[1].range == parsedString.range(of: "block"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatOtherMatchingSymbolsAreNotParsed() {
        do {
            let poundRule = Rule(symbol: Symbol(character: "#"))

            let (parsedString, parsedElements) = try ElementParser.parse("#abc# def $ghi$ _jkl_ *mno*",
                                                                         using: [poundRule])

            XCTAssert(parsedString == "abc def $ghi$ _jkl_ *mno*")
            XCTAssert(parsedElements.count == 1)

            XCTAssert(parsedElements[0].rule == poundRule)
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }

    func testThatRuleSymbolsCanBeEscaped() {
        do {
            let poundRule = Rule(symbol: Symbol(character: "#"))
            let curlyBracketRule = Rule(openingSymbol: Symbol(character: "{"), closingSymbol: Symbol(character: "}"))

            let (parsedString, parsedElements) = try ElementParser.parse("#abc# {def} ghi \\#jkl\\# \\{mno\\}",
                                                                         using: [poundRule, curlyBracketRule])

            XCTAssert(parsedString == "abc def ghi #jkl# {mno}")
            XCTAssert(parsedElements.count == 2)

            XCTAssert(parsedElements[0].rule == poundRule)
            XCTAssert(parsedElements[0].range == parsedString.range(of: "abc"))

            XCTAssert(parsedElements[1].rule == curlyBracketRule)
            XCTAssert(parsedElements[1].range == parsedString.range(of: "def"))
        } catch {
            XCTFail("Parsing failed.")
        }
    }

}
