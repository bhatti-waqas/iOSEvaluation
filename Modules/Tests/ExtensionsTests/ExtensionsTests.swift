//
//  ExtensionsTests.swift
//  
//
//  Created by Waqas Naseem on 25/09/2023.
//

import XCTest
@testable import Extensions

final class ExtensionsTests: XCTestCase {
    
    func testLocalization() {
        // Given
        let originalString = "Hello, World!"
        
        // When
        let localizedString = originalString.localize()
        
        // Then
        XCTAssertNotEqual(localizedString, originalString, "The localized string should be different from the original string")
        XCTAssertFalse(localizedString.isEmpty, "The localized string should not be empty")
    }
}
