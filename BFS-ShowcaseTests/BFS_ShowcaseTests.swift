//
//  BFS_ShowcaseTests.swift
//  BFS-ShowcaseTests
//
//  Created by csuftitan on 4/7/22.
//

import XCTest
@testable import BFS_Showcase

class BFS_ShowcaseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    func testWidth(){
        let grid1 = Grid(width: 2, height: 2)
        XCTAssertEqual(grid1.width, 2)
    }
    
    func testHeight(){
        let grid1 = Grid(width:2, height: 2)
        XCTAssertEqual(grid1.height, 2)
    }
    func testBFSWidth(){
        let bfs1 = BFS()
        XCTAssertEqual(bfs1.grid.width, 8)
    }
    func testBFSHeight(){
        let bfs1 = BFS()
        XCTAssertEqual(bfs1.grid.height, 8)
    }
}
