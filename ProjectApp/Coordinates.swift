//
//  Coordinates.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 3/24/22.
//

import Foundation

class Coordinates {
    var latitude: Double
    var longitude: Double
    
    init(lat latitude: Double = 0.0, long longitude: Double = 0.0) {
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func distanceTo(otherCoords: Coordinates) -> Double {
        return sqrt(pow(latitude - otherCoords.latitude, 2) + pow(longitude - otherCoords.longitude, 2))
    }
}
