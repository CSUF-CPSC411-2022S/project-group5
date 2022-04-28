//
//  MapAgent.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 3/10/22.
//

import Foundation
import SwiftUI

class MapAgent: ObservableObject {
    @Published var strLatitude: String
    @Published var strLongitude: String
    @Published var strDirection: String
    var range: Double
    var fieldOfView: Double
    
    var coords: Coordinates {
        get {
            return Coordinates(lat: Double(strLatitude) ?? 0.0, lon: Double(strLongitude) ?? 0.0)
        }
        set(newCoords) {
            strLatitude = String(newCoords.lat)
            strLongitude = String(newCoords.lon)
        }
    }
    
    var direction: Double {
        get {
            return Double(strDirection) ?? 0.0
        }
        set(newDir) {
            strDirection = String(newDir)
        }
    }
    
    init(coords coordinates: Coordinates = Coordinates(), dir direction: Double = 0.0, range: Double = 2.0, fov fieldOfView: Double = 60.0) {
        self.strLatitude = String(coordinates.lat)
        self.strLongitude = String(coordinates.lon)
        self.strDirection = String(direction)
        self.range = range
        self.fieldOfView = fieldOfView
    }
    
    func isInRangeOf(otherCoords: Coordinates) -> Bool {
        return coords.distanceTo(other: otherCoords) <= range
    }
    
    func isInDirectionOf(otherCoords: Coordinates) -> Bool {
        let angleTo = coords.bearingTo(other: otherCoords)
        return abs(direction - angleTo) < fieldOfView
    }
    
    func isLookingAt(otherCoords: Coordinates) -> Bool {
        return isInRangeOf(otherCoords: otherCoords) && isInDirectionOf(otherCoords: otherCoords)
    }
    
    static func ==(lhs: MapAgent, rhs: MapAgent) -> Bool {
        return lhs.strLatitude == rhs.strLatitude && lhs.strLongitude == rhs.strLongitude
        && lhs.strDirection == rhs.strDirection && lhs.range == rhs.range && lhs.fieldOfView == rhs.fieldOfView
    }
}

struct MapAgentForm: View {
    @ObservedObject var agent: MapAgent
    
    var body: some View {
        VStack {
            HStack {
                Text("Latitude:")
                TextField("Latitude", text: $agent.strLatitude)
                Spacer()
            }
            HStack {
                Text("Longitude:")
                TextField("Longitude", text: $agent.strLongitude)
                Spacer()
            }
            HStack {
                Text("Direction:")
                TextField("Direction", text: $agent.strDirection)
                Spacer()
            }
            DirectionTri()
                .fill(.blue)
                .rotationEffect(.degrees(-agent.direction))
                .frame(width: 50, height: 50)
        }
    }
}

struct MapAgentDisplay: View {
    @ObservedObject var agent: MapAgent
    
    var body: some View {
        VStack {
            HStack {
                Text("Latitude: \(String(format: "%.2f", agent.coords.lat))")
                Text("Longitude: \(String(format: "%.2f", agent.coords.lon))")
            }
            Text("Direction: \(String(format: "%.2f", agent.direction))")
            Text("Range: \(String(format: "%.2f", agent.range))")
            Text("FOV: \(String(format: "%.2f", agent.fieldOfView))")
        }.padding().background(Color.blue)
    }
}
