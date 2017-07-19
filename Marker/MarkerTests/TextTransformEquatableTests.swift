//
//  TextTransformEquatableTests.swift
//  Marker
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import Marker

class TextTransformEquatableTests: XCTestCase {

    func testTextStyle_isEqual_whenSameValue_andNotCustom() {
        let none: TextTransform = .none
        let lowercased: TextTransform = .lowercased
        let uppercased: TextTransform = .uppercased
        let capitalized: TextTransform = .capitalized
        
        XCTAssertEqual(none, none)
        XCTAssertEqual(lowercased, lowercased)
        XCTAssertEqual(uppercased, uppercased)
        XCTAssertEqual(capitalized, capitalized)
    }
    
    func testTextStyle_isNotEqual_whenCustom() {
        let custom: TextTransform = .custom({ string in "\(string) \(string)" })
        
        XCTAssertNotEqual(custom, custom)
    }
    
}
