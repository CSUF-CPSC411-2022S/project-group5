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
    @Published var strRange: String
    
    var coordinates: Coordinates {
        get {
            return Coordinates(lat: Double(strLatitude) ?? 0.0, long: Double(strLongitude) ?? 0.0)
        }
        set(newCoords) {
            strLatitude = String(newCoords.latitude)
            strLongitude = String(newCoords.longitude)
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
    
    var range: Double {
        get {
            return Double(strRange) ?? 0.0
        }
        set(newRange) {
            strRange = String(newRange)
        }
    }
    
    init(strLatitude: String = "0.0", strLongitude: String = "0.0", strDirection: String = "0.0", strRange: String = "0.0") {
        self.strLatitude = strLatitude
        self.strLongitude = strLongitude
        self.strDirection = strDirection
        self.strRange = strRange
    }
    
    init(coords coordinates: Coordinates, dir direction: Double = 0.0, range: Double = 0.0) {
        self.strLatitude = String(coordinates.latitude)
        self.strLongitude = String(coordinates.longitude)
        self.strDirection = String(direction)
        self.strRange = String(range)
    }
    
    func isInRangeOf(otherCoords: Coordinates) -> Bool {
        return coordinates.distanceTo(otherCoords: otherCoords) <= range
    }
    
    static func ==(lhs: MapAgent, rhs: MapAgent) -> Bool {
        return lhs.strLatitude == rhs.strLatitude && lhs.strLongitude == rhs.strLongitude
            && lhs.strDirection == rhs.strDirection && lhs.strRange == rhs.strRange
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
            HStack {
                Text("Range:")
                TextField("Range", text: $agent.strRange)
                Spacer()
            }
        }
    }
}

struct MapAgentDisplay: View {
    @ObservedObject var agent: MapAgent
    
    var body: some View {
        VStack {
            HStack {
                Text("Latitude: \(String(format: "%.2f", agent.coordinates.latitude))")
                Text("Longitude: \(String(format: "%.2f", agent.coordinates.longitude))")
            }
            Text("Direction: \(String(format: "%.2f", agent.direction))")
            Text("Range: \(String(format: "%.2f", agent.range))")
        }.padding().background(Color.blue)
    }
}
