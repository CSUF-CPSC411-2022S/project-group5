//
//  Building.swift
//  CSUFExplore
//
//  Created by Zach Hofmeister on 2/23/22.
//

import Foundation

class Building {
    var name: String
    var description: String
    var coords: Coordinates
    
    init(named name: String = "", for description: String = "", at coords: Coordinates = Coordinates()) {
        self.name = name;
        self.description = description;
        self.coords = coords;
    }
}
