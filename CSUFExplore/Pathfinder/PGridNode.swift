//
//  PGridNode.swift
//  BFS-Showcase
//
//  Created by Mixalis Dobekidis on 24/1/21.
//

import Foundation

class PGridNode {
    var x:Int = 0
    var y:Int = 0
    var type:PCell!
    var opened:Bool = false
    var closed:Bool = false
    var parent:PGridNode!
    
    init(x:Int, y:Int, type:PCell) {
        self.x = x
        self.y = y
        self.type = type
    }
    
    func getX() -> Int {
        return self.x
    }
    
    func getY() -> Int {
        return self.y
    }
    
    func getType() -> PCell {
        return type ?? .Empty
    }
    
    func getAsML() -> MazeLocation {
        return MazeLocation(row: x, col: y)
    }
}

