//
//  TextTransform+Extensions.swift
//  Marker
//
//  Created by Harlan Kellaway on 7/7/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

import Foundation

// MARK: - Protocol conformance

// MARK: Equatable

extension TextTransform: Equatable { }

public func ==(lhs: TextTransform, rhs: TextTransform) -> Bool {
    switch (lhs, rhs) {
    case (.none, .none):
        return true
    case (.lowercased, .lowercased):
        return true
    case (.uppercased, .uppercased):
        return true
    default:
        return false
    }
}
