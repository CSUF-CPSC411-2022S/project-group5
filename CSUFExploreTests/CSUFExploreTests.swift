//
//  CSUFExploreTests.swift
//  CSUFExploreTests
//
//  Created by Zach Hofmeister lon 2/23/22.
//

import XCTest
@testable import CSUFExplore

class CSUFExploreTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocatilon of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocatilon of each test method in the class.
    }

    func testMapAgentInit() {
        let agent = MapAgent()
        XCTAssertNotNil(agent)
    }
    
    func testMapAgentInitValues() {
        let agentCoords = MapAgent(coords: Coordinates(lat: 1, lon: 1), dir: 1, range: 1, fov: 1)
        XCTAssert(agentCoords.coords == Coordinates(lat: 1, lon: 1) && agentCoords.direction == 1 && agentCoords.range == 1 && agentCoords.fieldOfView == 1)
    }
    
    func testMapAgentRangeOf() {
        let agent = MapAgent(coords: Coordinates(lat: 0, lon: 0), dir: 0, range: 1)
        let coords = Coordinates(lat: 1, lon: 0)
        XCTAssert(agent.isInRangeOf(otherCoords: coords))
    }
    
    func testBuildingInit() {
        let building = Building()
        XCTAssertNotNil(building)
    }
    
    func testBuildingInitValues() {
        let building = Building(named: "bldg", for: "stuff", at: Coordinates(lat: 1, lon: 1))
        XCTAssert((building.name == "bldg" && building.description == "stuff" && building.coords.lat == 1 && building.coords.lon == 1))
    }
    
    func testCoordinatesInit() {
        let coords = Coordinates()
        XCTAssertNotNil(coords)
    }
    
    func testCoordinatesInitValues() {
        let coords = Coordinates(lat: 1, lon: 1)
        XCTAssert(coords.lat == 1 && coords.lon == 1)
    }
    
    func testCoordinatesDistance() {
        let coords1 = Coordinates(lat: 0, lon: 3)
        let coords2 = Coordinates(lat: 4, lon: 0)
        XCTAssertEqual(coords1.distanceTo(other: coords2), 5)
    }
    
    func testCoordinatesAdd() {
        let coords1 = Coordinates(lat: 2, lon: 3)
        let coords2 = Coordinates(lat: 3, lon: 2)
        let coordsRef = Coordinates(lat: 5, lon: 5)
        XCTAssertEqual(coords1 + coords2, coordsRef)
    }
    
    func testCoordinatesBearings() {
        let coords1 = Coordinates(lat: 0, lon: 1)
        let coords2 = Coordinates(lat: 1, lon: 0)
        XCTAssertEqual(1, 1)
    }
}

class GridArrowTests: XCTestCase {
    
    func testCellCoordInit() {
        let coord = CellCoord(row: 0, col: 0)
        XCTAssertNotNil(coord)
    }
    
    func testCellInit() {
        let cell = Cell(symbol: "X", traveled: false, coord: CellCoord(row: 0,col: 0))
        XCTAssertNotNil(cell)
    }
    
    func testCellArrInit() {
        let arr = CellArr()
        XCTAssertNotNil(arr)
    }
    
    func testGridInit() {
        let grid = Grid(colNum: 3, rowNum: 3, input_path: "OXOOXOOXX", start_coords: CellCoord(row: 0, col: 0), end_coords: CellCoord(row: 2,col: 2))
        XCTAssertNotNil(grid)
    }
    
    func testPath(){
        let grid = Grid(colNum: 3, rowNum: 3, input_path: "OXOOXOOXX", start_coords: CellCoord(row: 0, col: 0), end_coords: CellCoord(row: 2,col: 2))
        XCTAssertEqual(grid[0, 1].symbol,"X")
        XCTAssertEqual(grid[1, 1].symbol,"X")
        XCTAssertEqual(grid[2, 1].symbol,"X")
        XCTAssertEqual(grid[2, 2].symbol,"X")
    }
    
    func testNextDirectionCorrect(){
        let grid = Grid(colNum: 3, rowNum: 3, input_path: "OXOOXOOXX", start_coords: CellCoord(row: 0, col: 0), end_coords: CellCoord(row: 2,col: 2))
        XCTAssertEqual(grid.getNextDirection(cur_row: 0, cur_col: 1).direction, 180)
        XCTAssertEqual(grid.getNextDirection(cur_row: 1, cur_col: 1).direction, 180)
        XCTAssertEqual(grid.getNextDirection(cur_row: 2, cur_col: 1).direction, 90)
    }
    
    func testNextDirectionIncorrect(){
        let grid = Grid(colNum: 3, rowNum: 3, input_path: "OXOOXOOXX", start_coords: CellCoord(row: 0, col: 0), end_coords: CellCoord(row: 2,col: 2))
        XCTAssertEqual(grid.getNextDirection(cur_row: 0, cur_col: 0).direction, 90)
        XCTAssertEqual(grid.getNextDirection(cur_row: 2, cur_col: 0).direction, 90)
    }
    
    func testValidMoves(){
        let grid = Grid(colNum: 3, rowNum: 3, input_path: "OXOOXOOXX", start_coords: CellCoord(row: 0, col: 0), end_coords: CellCoord(row: 2,col: 2))
        let validmoves = [CellCoord(row: 0, col: 1), CellCoord(row: 2, col: 1), CellCoord(row: 1, col: 0), CellCoord(row: 1, col: 2)]
        XCTAssertEqual(grid.getNextDirection(cur_row: 1, cur_col: 1).valid_moves, validmoves)
    }
    func testGridWidth(){
        let grid1 = PGrid(width: 5, height: 4)
        XCTAssertEqual(grid1.width, 5)
    }
    func testGridHeight(){
        let grid1 = PGrid(width: 5, height: 4)
        XCTAssertEqual(grid1.height, 4)
    }
}
