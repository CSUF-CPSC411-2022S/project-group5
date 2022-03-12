//
// Arrow.swift
//  ProjectApp
//
//  Created by Jacob Nguyen on 2/24/22.
//

import Foundation
import SwiftUI

//Latitude is always first

struct Arrow {
    enum Directions {
        case North
        case South
        case East
        case West
    }
    
    var Coords: [String: [Float]] = [:]
    var LatDir: Directions {
        get {
            if Coords["AnchorOne"]![0] - Coords["AnchorTwo"]![0] < 0 {
                return Directions.West
            }
            return Directions.East
        }
    }
    var LongDir: Directions {
        get {
            if Coords["AnchorOne"]![1] - Coords["AnchorTwo"]![1] < 0 {
                return Directions.South
            }
            return Directions.North
        }
    }
    init(anchorOne: [Float], anchorTwo: [Float]){
        Coords["AnchorOne"] = anchorOne
        Coords["AnchorTwo"] = anchorTwo
    }
}

