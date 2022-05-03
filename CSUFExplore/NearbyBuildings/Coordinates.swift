//
//  Coordinates.swift
//  CSUFExplore
//
//  Created by Zach Hofmeister on 3/24/22.
//

import Foundation

class Coordinates : Equatable {
    var lat: Double //y
    var lon: Double //x
    static let zero: Coordinates = Coordinates()
    
    init(lat: Double = 0.0, lon: Double = 0.0) {
        self.lat = lat
        self.lon = lon
    }
    
    func distanceTo(other: Coordinates) -> Double {
        return sqrt(pow(lat - other.lat, 2) + pow(lon - other.lon, 2))
    }
    
    func bearingTo(other: Coordinates) -> Double {
//        let deltaLon = other.lon - self.lon
//        let X = cos(other.lat) * sin(deltaLon)
//        let Y = cos(self.lat) * sin(other.lat) - sin(self.lat) * cos(other.lat) * cos(deltaLon)
//        print(atan2(X, Y) * 180 / Double.pi)
//        return atan2(X, Y) * 180 / Double.pi
        let delta = other - self
        return atan2(delta.lat, delta.lon) * 180 / Double.pi
    }
    
    func dot(other: Coordinates) -> Double {
        return self.lat * other.lat + self.lon * other.lon
    }
    
    func mag() -> Double {
        return Coordinates.zero.distanceTo(other: self)
    }
    
    static func == (lhs: Coordinates, rhs: Coordinates) -> Bool {
        return lhs.lat == rhs.lat && lhs.lon == rhs.lon
    }
    
    static func +(lhs: Coordinates, rhs: Coordinates) -> Coordinates {
        return Coordinates(lat: lhs.lat + rhs.lat, lon: lhs.lon + rhs.lon)
    }
    
    static func -(lhs: Coordinates, rhs: Coordinates) -> Coordinates {
        return Coordinates(lat: lhs.lat - rhs.lat, lon: lhs.lon - rhs.lon)
    }
}
