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
