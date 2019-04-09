//
//  TextStyleFactoryFunctionTests.swift
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

class TextStyleFactoryFunctionTests: XCTestCase {
    
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

    func testTextStyleFactory_whenNewFont_newFontIsUsed() {
        let newFont = Font(name: textStyle.font.fontName, size: textStyle.font.pointSize + 10)!
        let newTextStyle = textStyle.with(newFont: newFont)
        let expectedTextStyle = TextStyle(font: newFont,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewEmFont_newEmFontIsUsed() {
        let newEmFont = Font(name: textStyle.emFont.fontName, size: textStyle.font.pointSize + 10)!
        let newTextStyle = textStyle.with(newEmFont: newEmFont)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: newEmFont,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewStrongFont_newStrongFontIsUsed() {
        let newStrongFont = Font(name: textStyle.strongFont.fontName, size: textStyle.font.pointSize + 10)!
        let newTextStyle = textStyle.with(newStrongFont: newStrongFont)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: newStrongFont,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewTextColor_newTextColorIsUsed() {
        let newTextColor = Color.blue
        let newTextStyle = textStyle.with(newTextColor: newTextColor)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: newTextColor,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewCharacterSpacing_newCharacterIsUsed() {
        let newCharacterSpacing = textStyle.characterSpacing! + 10
        let newTextStyle = textStyle.with(newCharacterSpacing: newCharacterSpacing)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: newCharacterSpacing,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewLineSpacing_newLineSpacingIsUsed() {
        let newLineSpacing = textStyle.lineSpacing! + 10
        let newTextStyle = textStyle.with(newLineSpacing: newLineSpacing)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: textStyle.characterSpacing,
                                          lineSpacing: newLineSpacing,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewLineHeightMultiple_newLineHeightMultipleIsUsed() {
        let newLineHeightMultiple = textStyle.lineHeightMultiple! + 10
        let newTextStyle = textStyle.with(newLineHeightMultiple: newLineHeightMultiple)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: textStyle.characterSpacing,
                                          lineSpacing: textStyle.lineSpacing,
                                          lineHeightMultiple: newLineHeightMultiple,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewMinimumLineHeight_newMinimumLineHeightIsUsed() {
        let newMinimumLineHeight = textStyle.minimumLineHeight! + 10
        let newTextStyle = textStyle.with(newMinimumLineHeight: newMinimumLineHeight)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: textStyle.characterSpacing,
                                          lineSpacing: textStyle.lineSpacing,
                                          lineHeightMultiple: textStyle.lineHeightMultiple,
                                          minimumLineHeight: newMinimumLineHeight,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewMaximumLineHeight_newMaximumLineHeightIsUsed() {
        let newMaximumLineHeight = textStyle.maximumLineHeight! + 10
        let newTextStyle = textStyle.with(newMaximumLineHeight: newMaximumLineHeight)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: textStyle.characterSpacing,
                                          lineSpacing: textStyle.lineSpacing,
                                          lineHeightMultiple: textStyle.lineHeightMultiple,
                                          minimumLineHeight: textStyle.minimumLineHeight,
                                          maximumLineHeight: newMaximumLineHeight,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewFirstLineHeadIndent_newFirstLineHeadIndentIsUsed() {
        let newFirstLineHeadIndent = textStyle.firstLineHeadIndent! + 10
        let newTextStyle = textStyle.with(newFirstLineHeadIndent: newFirstLineHeadIndent)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: textStyle.characterSpacing,
                                          lineSpacing: textStyle.lineSpacing,
                                          lineHeightMultiple: textStyle.lineHeightMultiple,
                                          minimumLineHeight: textStyle.minimumLineHeight,
                                          maximumLineHeight: textStyle.maximumLineHeight,
                                          firstLineHeadIndent: newFirstLineHeadIndent,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewHeadIndent_newHeadIndentIsUsed() {
        let newHeadIndent = textStyle.headIndent! + 10
        let newTextStyle = textStyle.with(newHeadIndent: newHeadIndent)
        let expectedTextStyle = TextStyle(font: textStyle.font,
                                          emFont: textStyle.emFont,
                                          strongFont: textStyle.strongFont,
                                          textColor: textStyle.textColor,
                                          characterSpacing: textStyle.characterSpacing,
                                          lineSpacing: textStyle.lineSpacing,
                                          lineHeightMultiple: textStyle.lineHeightMultiple,
                                          minimumLineHeight: textStyle.minimumLineHeight,
                                          maximumLineHeight: textStyle.maximumLineHeight,
                                          firstLineHeadIndent: textStyle.firstLineHeadIndent,
                                          headIndent: newHeadIndent,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewParagraphSpacing_newParagraphSpacingIsUsed() {
        let newParagraphSpacing = textStyle.paragraphSpacing! + 10
        let newTextStyle = textStyle.with(newParagraphSpacing: newParagraphSpacing)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          paragraphSpacing: newParagraphSpacing,
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
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewParagraphSpacingBefore_newParagraphSpacingBeforeIsUsed() {
        let newParagraphSpacingBefore = textStyle.paragraphSpacingBefore! + 10
        let newTextStyle = textStyle.with(newParagraphSpacingBefore: newParagraphSpacingBefore)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          paragraphSpacingBefore: newParagraphSpacingBefore,
                                          textAlignment: textStyle.textAlignment,
                                          lineBreakMode: textStyle.lineBreakMode,
                                          strikethroughStyle: textStyle.strikethroughStyle,
                                          strikethroughColor: textStyle.strikethroughColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewTextAlignment_newTextAlignmentIsUsed() {
        let newTextAlignment: NSTextAlignment = .right
        let newTextStyle = textStyle.with(newTextAlignment: newTextAlignment)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          textAlignment: newTextAlignment,
                                          lineBreakMode: textStyle.lineBreakMode,
                                          strikethroughStyle: textStyle.strikethroughStyle,
                                          strikethroughColor: textStyle.strikethroughColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewLineBreakMode_newLineBreakModeIsUsed() {
        let newLineBreakMode: NSLineBreakMode = .byCharWrapping
        let newTextStyle = textStyle.with(newLineBreakMode: newLineBreakMode)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          lineBreakMode: newLineBreakMode,
                                          strikethroughStyle: textStyle.strikethroughStyle,
                                          strikethroughColor: textStyle.strikethroughColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewStrikethroughStyle_newStrikethroughStyleIsUsed() {
        let newStrikethroughStyle: NSUnderlineStyle = .double
        let newTextStyle = textStyle.with(newStrikethroughStyle: newStrikethroughStyle)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          strikethroughStyle: newStrikethroughStyle,
                                          strikethroughColor: textStyle.strikethroughColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewStrikethroughColor_newStrikethroughColorIsUsed() {
        let newStrikethroughColor = Color.blue
        let newTextStyle = textStyle.with(newStrikethroughColor: newStrikethroughColor)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          strikethroughColor: newStrikethroughColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewUnderlineStyle_newUnderlineStyleIsUsed() {
        let newUnderlineStyle: NSUnderlineStyle = .double
        let newTextStyle = textStyle.with(newUnderlineStyle: newUnderlineStyle)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          underlineStyle: newUnderlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewUnderlineColor_newUnderlineColorIsUsed() {
        let newUnderlineColor = Color.blue
        let newTextStyle = textStyle.with(newUnderlineColor: newUnderlineColor)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          underlineColor: newUnderlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }


    func testTextStyleFactory_whenNewLinkFont_newLinkFontIsUsed() {
        let newLinkFont = Font(name: textStyle.linkFont!.fontName, size: textStyle.linkFont!.pointSize + 10)!
        let newTextStyle = textStyle.with(newLinkFont: newLinkFont)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          linkFont: newLinkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)

        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }

    func testTextStyleFactory_whenNewLinkColor_NewLinkColorIsUsed() {
        let newLinkColor = Color.red
        let newTextStyle = textStyle.with(newLinkColor: newLinkColor)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          linkColor: newLinkColor,
                                          textTransform: textStyle.textTransform)

        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenNewTextTransform_newTextTransformIsUsed() {
        let newTextTransform: TextTransform = .uppercased
        let newTextStyle = textStyle.with(newTextTransform: newTextTransform)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          textTransform: newTextTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }

    func testTextStyleFactory_whenStrikethrough_strikethroughPropertiesAreSet() {
        let strikethroughStyle: NSUnderlineStyle = .double
        let strikethroughColor = Color.green
        let newTextStyle = textStyle.strikethrough(color: strikethroughColor, style: strikethroughStyle)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          strikethroughStyle: strikethroughStyle,
                                          strikethroughColor: strikethroughColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)

        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }

    func testTextStyleFactory_whenStrikethrough_defaultsToSingleLineOfSameColor() {
        let expectedStyle: NSUnderlineStyle = .single
        let expectedColor = textStyle.textColor
        let newTextStyle = textStyle.strikethrough()
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          strikethroughStyle: expectedStyle,
                                          strikethroughColor: expectedColor,
                                          underlineStyle: textStyle.underlineStyle,
                                          underlineColor: textStyle.underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)

        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }

    func testTextStyleFactory_whenUnderlined_underlinePropertiesAreSet() {
        let underlineStyle: NSUnderlineStyle = .double
        let underlineColor = Color.green
        let newTextStyle = textStyle.underlined(color: underlineColor, style: underlineStyle)
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          underlineStyle: underlineStyle,
                                          underlineColor: underlineColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
    func testTextStyleFactory_whenUnderlined_defaultsToSingleLineOfSameColor() {
        let expectedStyle: NSUnderlineStyle = .single
        let expectedColor = textStyle.textColor
        let newTextStyle = textStyle.underlined()
        let expectedTextStyle = TextStyle(font: textStyle.font,
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
                                          underlineStyle: expectedStyle,
                                          underlineColor: expectedColor,
                                          linkFont: textStyle.linkFont,
                                          linkColor: textStyle.linkColor,
                                          textTransform: textStyle.textTransform)
        
        XCTAssertEqual(newTextStyle, expectedTextStyle)
    }
    
}
