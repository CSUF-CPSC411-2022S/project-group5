//
//  Building.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 2/23/22.
//

import Foundation

class Building {
    var name: String
    var description: String
    var coordinates: Coordinates
    
    init(named name: String = "", is description: String = "", at coordinates: Coordinates = Coordinates()) {
        self.name = name;
        self.description = description;
        self.coordinates = coordinates;
    }
}

struct Coordinates {
    var longitude: Double
    var latitude: Double
    
    init(longitude: Double = 0.0, latitude: Double = 0.0) {
        self.longitude = longitude
        self.latitude = latitude
    }
}
