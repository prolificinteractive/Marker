//
//  TextStyleEquatableTests.swift
//  Marker
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

#if os(iOS) || os(tvOS)
    import UIKit
#elseif os(macOS) || os(OSX)
    import AppKit
#endif

import XCTest
@testable import Marker

class TextStyleEquatableTests: XCTestCase {
    
    var textStyle: TextStyle!
    
    override func setUp() {
        super.setUp()
     
        textStyle = TextStyle(font: Font(name: "Helvetica", size: 10)!,
                              emFont: Font(name: "Helvetica-Oblique", size: 10)!,
                              strongFont: Font(name: "Helvetica-Bold", size: 10)!,
                              textColor: Color.red,
                              characterSpacing: 1,
                              lineSpacing: 2,
                              lineHeightMultiple: 3,
                              minimumLineHeight: 4,
                              maximumLineHeight: 5,
                              firstLineHeadIndent: 6,
                              headIndent: 7,
                              paragraphSpacing: 8,
                              paragraphSpacingBefore: 9,
                              textAlignment: .left,
                              lineBreakMode: .byWordWrapping,
                              strikethroughStyle: .single,
                              strikethroughColor: Color.red,
                              underlineStyle: .single,
                              underlineColor: Color.red,
                              linkFont: Font(name: "Helvetica-Bold", size: 10)!,
                              linkColor: Color.blue,
                              textTransform: .lowercased)
    }
    
    override func tearDown() {
        textStyle = nil
        
        super.tearDown()
    }

    func testTextStyle_isEqual_whenAllPropertiesTheSame() {
        let sameTextStyle = TextStyle(font: textStyle.font,
                                      emFont: textStyle.emFont,
                                      strongFont: textStyle.strongFont,
                                      textColor: textStyle.textColor,
                                      characterSpacing: textStyle.characterSpacing,
                                      lineSpacing: textStyle.lineSpacing,
                                      lineHeightMultiple: textStyle.lineHeightMultiple,
                                      minimumLineHeight: textStyle.minimumLineHeight,
                                      maximumLineHeight: textStyle.maximumLineHeight,
                                      firstLineHeadIndent: textStyle.firstLineHeadIndent,
                                      headIndent: textStyle.headIndent,
                                      paragraphSpacing: textStyle.paragraphSpacing,
                                      paragraphSpacingBefore: textStyle.paragraphSpacingBefore,
                                      textAlignment: textStyle.textAlignment,
                                      lineBreakMode: textStyle.lineBreakMode,
                                      strikethroughStyle: textStyle.strikethroughStyle,
                                      strikethroughColor: textStyle.strikethroughColor,
                                      underlineStyle: textStyle.underlineStyle,
                                      underlineColor: textStyle.underlineColor,
                                      linkFont: textStyle.linkFont,
                                      linkColor: textStyle.linkColor,
                                      textTransform: textStyle.textTransform)
        
        XCTAssertEqual(textStyle, sameTextStyle)
    }
    
    func testTextStyle_isNotEqual_whenPropertiesAreDiffernt() {
        let differentFont = textStyle.with(newFont: Font(name: textStyle.font.fontName, size: textStyle.font.pointSize + 10)!)
        let differentEmFont = textStyle.with(newEmFont: Font(name: textStyle.emFont.fontName, size: textStyle.emFont.pointSize + 10)!)
        let differentStrongFont = textStyle.with(newStrongFont: Font(name: textStyle.strongFont.fontName, size: textStyle.strongFont.pointSize + 10)!)
        let differentTextColor = textStyle.with(newTextColor: Color.blue)
        let differentCharacterSpacing = textStyle.with(newCharacterSpacing: textStyle.characterSpacing! + 10)
        let differentLineSpacing = textStyle.with(newLineSpacing: textStyle.lineSpacing! + 10)
        let differentLineHeightMultiple = textStyle.with(newLineHeightMultiple: textStyle.lineHeightMultiple! + 10)
        let differentMinimumLineHeight = textStyle.with(newMinimumLineHeight: textStyle.minimumLineHeight! + 10)
        let differentMaximumLineHeight = textStyle.with(newMaximumLineHeight: textStyle.maximumLineHeight! + 10)
        let differentFirstLineHeadIndent = textStyle.with(newFirstLineHeadIndent: textStyle.firstLineHeadIndent! + 10)
        let differentHeadIndent = textStyle.with(newHeadIndent: textStyle.headIndent! + 10)
        let differentParagraphSpacing = textStyle.with(newParagraphSpacing: textStyle.paragraphSpacing! + 10)
        let differentParagraphSpacingBefore = textStyle.with(newParagraphSpacingBefore: textStyle.paragraphSpacingBefore! + 10)
        let differentTextAlignment = textStyle.with(newTextAlignment: .right)
        let differentLineBreakMode = textStyle.with(newLineBreakMode: .byCharWrapping)
        let differentStrikethroughStyle = textStyle.with(newStrikethroughStyle: .double)
        let differentStrikethroughColor = textStyle.with(newStrikethroughColor: Color.blue)
        let differentUnderlineStyle = textStyle.with(newUnderlineStyle: .double)
        let differentUnderlineColor = textStyle.with(newUnderlineColor: Color.blue)
        let differentLinkFont = textStyle.with(newLinkFont: Font(name: textStyle.linkFont!.fontName, size: textStyle.linkFont!.pointSize + 10)!)
        let differentLinkColor = textStyle.with(newLinkColor: Color.red)
        let differentTextTransform = textStyle.with(newTextTransform: .uppercased)
        
        
        XCTAssertNotEqual(textStyle, differentFont)
        XCTAssertNotEqual(textStyle, differentEmFont)
        XCTAssertNotEqual(textStyle, differentStrongFont)
        XCTAssertNotEqual(textStyle, differentTextColor)
        XCTAssertNotEqual(textStyle, differentCharacterSpacing)
        XCTAssertNotEqual(textStyle, differentLineSpacing)
        XCTAssertNotEqual(textStyle, differentLineHeightMultiple)
        XCTAssertNotEqual(textStyle, differentMinimumLineHeight)
        XCTAssertNotEqual(textStyle, differentMaximumLineHeight)
        XCTAssertNotEqual(textStyle, differentFirstLineHeadIndent)
        XCTAssertNotEqual(textStyle, differentHeadIndent)
        XCTAssertNotEqual(textStyle, differentParagraphSpacing)
        XCTAssertNotEqual(textStyle, differentParagraphSpacingBefore)
        XCTAssertNotEqual(textStyle, differentTextAlignment)
        XCTAssertNotEqual(textStyle, differentLineBreakMode)
        XCTAssertNotEqual(textStyle, differentStrikethroughStyle)
        XCTAssertNotEqual(textStyle, differentStrikethroughColor)
        XCTAssertNotEqual(textStyle, differentUnderlineStyle)
        XCTAssertNotEqual(textStyle, differentUnderlineColor)
        XCTAssertNotEqual(textStyle, differentLinkFont)
        XCTAssertNotEqual(textStyle, differentLinkColor)
        XCTAssertNotEqual(textStyle, differentTextTransform)
    }
    
}
