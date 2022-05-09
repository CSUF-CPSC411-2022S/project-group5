//
//  BFS.swift
//  BFS-Showcase
//
//  Created by Mixalis Dobekidis on 24/1/21.
//

import Foundation

class BFS {
    var grid:PGrid = PGrid(width: 8, height: 8)
    init() {
        
    }
    
    func findPath(start:MazeLocation, end: MazeLocation) -> Array<MazeLocation> {
        var openList:Array<PGridNode> = []
        let startNode:PGridNode = grid.getNodeAt(x: start.row, y: start.col)
        let endNode:PGridNode = grid.getNodeAt(x: end.row, y: end.col)
        var neighbors:Array<PGridNode> = []
        var neighbor:PGridNode!
        var node:PGridNode!
        var i = 0
        var l = 0
        
        openList.append(startNode)
        startNode.opened = true
        
        while openList.isEmpty == false {
            node = openList.remove(at: 0)
            startNode.closed = true
            
            print(node.x, node.y," is equal to: ", endNode.x, endNode.y)
            if node === endNode {
                return backtrace(node: endNode)
            }
            
            neighbors = grid.getNeighbors(node: node)
            
            i = 0
            l = neighbors.count
            for _ in i ..< l {
                neighbor = neighbors[i]
                
                if neighbor.closed == true || neighbor.opened == true {
                    i += 1
                    continue
                }
                
                openList.append(neighbor)
                neighbor.opened = true
                neighbor.parent = node
                i += 1
            }
        }
        
        return []
    }
    
    func backtrace(node:PGridNode) -> Array<MazeLocation> {
        var _node = node
        var path:Array<MazeLocation> = [MazeLocation(row: _node.x, col: _node.y)]
        while (_node.parent != nil) {
            _node = _node.parent
            path.append(MazeLocation(row: _node.x, col: _node.y))
        }
        return path.reversed()
    }
}
