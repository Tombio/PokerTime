//
//  PokerTimeTests.swift
//  PokerTimeTests
//
//  Created by Tomi Lahtinen on 11/04/2018.
//  Copyright © 2018 Tomi Lahtinen. All rights reserved.
//

import XCTest
@testable import PokerTime

class PokerTimeTests: XCTestCase {
    
    func testNumberAbrevation() {
        let one = 1.formatUsingAbbrevation()
        debugPrint(one)
        XCTAssert(1.formatUsingAbbrevation() == "1")
        XCTAssert(10.formatUsingAbbrevation() == "10")
        XCTAssert(99.formatUsingAbbrevation() == "99")
        XCTAssert(999.formatUsingAbbrevation() == "999")
        XCTAssert(9999.formatUsingAbbrevation() == "9999")
        XCTAssert(99999.formatUsingAbbrevation() == "100K")
        // This is an example of a functional test case.
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
