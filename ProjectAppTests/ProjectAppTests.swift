//
//  ProjectAppTests.swift
//  ProjectAppTests
//
//  Created by Zach Hofmeister on 2/23/22.
//

import XCTest
@testable import ProjectApp

class ProjectAppTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMapAgentInit() {
        let agent = MapAgent()
        XCTAssertNotNil(agent)
    }
    
    func testMapAgentInitValues() {
        let agentStr = MapAgent(strLatitude: "1.0", strLongitude: "1.0", strDirection: "1.0", strRange: "1.0")
        let agentCoords = MapAgent(coords: Coordinates(lat: 1, long: 1), dir: 1, range: 1)
        XCTAssert(agentStr == agentCoords)
    }
    
    func testMapAgentRangeOf() {
        let agent = MapAgent(coords: Coordinates(lat: 0, long: 0), dir: 0, range: 1)
        let coords = Coordinates(lat: 1, long: 0)
        XCTAssert(agent.isInRangeOf(otherCoords: coords))
    }
    
    func testBuildingInit() {
        let building = Building()
        XCTAssertNotNil(building)
    }
    
    func testBuildingInitValues() {
        let building = Building(named: "bldg", for: "stuff", at: Coordinates(lat: 1, long: 1))
        XCTAssert((building.name == "bldg" && building.description == "stuff" && building.coordinates.latitude == 1 && building.coordinates.longitude == 1))
    }
    
    func testCoordinatesInit() {
        let coords = Coordinates()
        XCTAssertNotNil(coords)
    }
    
    func testCoordinatesInitValues() {
        let coords = Coordinates(lat: 1, long: 1)
        XCTAssert(coords.latitude == 1 && coords.longitude == 1)
    }
    
    func testCoordinatesDistance() {
        let coords1 = Coordinates(lat: 0, long: 3)
        let coords2 = Coordinates(lat: 4, long: 0)
        XCTAssertEqual(coords1.distanceTo(otherCoords: coords2), 5)
    }
}
