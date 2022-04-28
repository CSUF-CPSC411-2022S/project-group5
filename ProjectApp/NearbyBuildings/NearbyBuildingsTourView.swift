//
//  NearbyBuildingsTourView.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 4/28/22.
//

import Foundation
import SwiftUI

struct NearbyBuildingsTour: View {
    var campusMap: [Building] = [
        Building(named: "McCarthy Hall", for: "Home to math and science classes.", at: Coordinates(lat: 5, lon: 2)),
        Building(named: "Pollak Library", for: "A great place to study, read, and get papers printed. Has a Starbucks coffee shop on the ground floor.", at: Coordinates(lat: 5, lon: 5)),
        Building(named: "Titan Student Union", for: "A great place to hang out or study. Has a food court, bowling, and other activities.", at: Coordinates(lat: 1, lon: 5)),
        Building(named: "The Gastronome", for: "The cafeteria for the dorm meal plans. Serves a wide variety of food for breakfast, lunch, and dinner.", at: Coordinates(lat: 8, lon: 8)),
        Building(named: "Computer Science Building", for: "Home to mostly computer science classes and related courses.", at: Coordinates(lat: 6.5, lon: 6)),
        Building(named: "Engineering Building", for: "Home to mostly engineering classes and related courses.", at: Coordinates(lat: 6, lon: 6))
    ]
    @StateObject var agent = MapAgent(coords: Coordinates(lat: 5.0, lon: 5.0), dir: 90)
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Enter your position (values between 1-10), direction, and range:")
                    .font(.headline)
                MapAgentForm(agent: agent)
                NavigationLink(destination: MapInfoDisplay(buildings: campusMap)) {
                    Text("See nearby map info")
                }
            }
        }.environmentObject(agent)
    }
}

struct MapInfoDisplay: View {
    var buildings: [Building]
    @EnvironmentObject var agent: MapAgent
    
    var body: some View {
        MapAgentDisplay(agent: agent)
        NearbyBuildingOutlineGroup(buildings: buildings)
    }
}

struct NearbyBuildingOutlineGroup: View {
    var buildings: [Building]
    @EnvironmentObject var agent: MapAgent
    
    var body: some View {
        VStack {
            List(buildings, id: \.name) {
                building in
                if agent.isLookingAt(otherCoords: building.coords) {
                    NavigationLink(destination: NearbyBuildingInfo(description: building.description, distance: agent.coords.distanceTo(other: building.coords), bearing: agent.coords.bearingTo(other: building.coords))) {
                        Text(building.name)
                    }
                }
            }
            Spacer()
        }
    }
}

struct NearbyBuildingInfo: View {
    var description: String
    var distance: Double
    var bearing: Double
    
    var body: some View {
        VStack {
            Text("Building description: \(description)")
            Text("Distance: \(String(format: "%.2f", distance)) units")
            Text("Bearing: \(String(format: "%.2f", bearing)) degrees")
        }
    }
}
