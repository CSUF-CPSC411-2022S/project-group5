//
//  ContentView.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    var campusMap: [Building] = [
        Building(named: "McCarthy Hall", for: "Math and science classes", at: Coordinates(lat: 5, long: 2)),
        Building(named: "Pollak Library", for: "Studying and reading", at: Coordinates(lat: 5, long: 5)),
        Building(named: "Titan Student Union", for: "Getting food, hanging out, studying", at: Coordinates(lat: 1, long: 5)),
        Building(named: "The Gastronome", for: "Cafeteria for dorms", at: Coordinates(lat: 8, long: 8)),
        Building(named: "Computer Science Building", for: "Computer science classes", at: Coordinates(lat: 6.5, long: 6)),
        Building(named: "Engineering Building", for: "Engineering, math, and CS classes", at: Coordinates(lat: 6, long: 6))
    ]
    @StateObject var agent = MapAgent(coords: Coordinates(lat: 5.0, long: 5.0), dir: 90, range: 2)
    
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
        NavigationView {
            VStack {
                List(buildings, id: \.name) {
                    building in
                    if agent.isInRangeOf(otherCoords: building.coordinates) {
                        NavigationLink(destination: NearbyBuildingInfo(description: building.description, distance: agent.coordinates.distanceTo(otherCoords: building.coordinates))) {
                            Text(building.name)
                        }
                    }
                }
                Spacer()
            }
        }
    }
}

struct NearbyBuildingInfo: View {
    var description: String
    var distance: Double
    
    var body: some View {
        VStack {
            Text("Building description: \(description)")
            Text("Distance: \(distance) units")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
