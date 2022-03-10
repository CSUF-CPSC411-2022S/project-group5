//
//  MapAgent.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 3/10/22.
//

import Foundation

class MapAgent: ObservableObject {
    @Published var strLatitude: String
    @Published var strLongitude: String
    @Published var strDirection: String
    
    var latitude: Double {
        get {
            return Double(strLatitude) ?? 0.0
        }
        set(newLat) {
            strLatitude = String(newLat)
        }
    }
    
    var longitude: Double {
        get {
            return Double(strLongitude) ?? 0.0
        }
        set(newLon) {
            strLongitude = String(newLon)
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
    
    init(strLatitude: String, strLongitude: String = "0.0", strDirection: String = "0.0") {
        self.strLatitude = strLatitude
        self.strLongitude = strLongitude
        self.strDirection = strDirection
    }
    
    init(latitude: Double = 0.0, longitude: Double = 0.0, direction: Double = 0.0) {
        self.strLatitude = String(latitude)
        self.strLongitude = String(longitude)
        self.strDirection = String(direction)
    }
}
