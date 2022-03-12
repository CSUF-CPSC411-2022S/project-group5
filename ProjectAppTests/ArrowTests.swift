//
//  ArrowTests.swift
//  ProjectAppTests
//
//  Created by Jacob Nguyen on 3/11/22.
//

import XCTest
@testable import Arrow

class ArrowTest: XCTestCase {
  
    func testArrowNorthWest(){
        var newArrow = Arrow([25.0, 23.0], [25.0, 23.0])
        XCTAssertEqual(newArrow.LatDir, .West)
        XCTAssertEqual(newArrow.LongDir, .North)
    }
    
    func testArrowSouthEast(){
        var newArrow = Arrow([-25.0, -23.0], [-25.0, -23.0])
        XCTAssertEqual(newArrow.LatDir, .East)
        XCTAssertEqual(newArrow.LongDir, .South)
    }

}
