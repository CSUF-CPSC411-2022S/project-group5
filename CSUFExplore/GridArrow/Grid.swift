//
//  Grid.swift
//  ProjectApp
//
//  Created by Jacob Nguyen on 4/9/22.
//

import Foundation
import SwiftUI

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct Cell: Identifiable {
    var id = UUID()
    var symbol: String
    var traveled: Bool
    var coord: CellCoord
}

struct CellArr: Identifiable {
    var id = UUID()
    var collection: [Cell] = []
    subscript(index: Int) -> Cell {
        get {
            return collection[index]
        }
       set {
           collection[index] = newValue
        }
        
    }
}

struct CellCoord: Equatable {
    var row: Int
    var col: Int
    var tuple: [Int] {
        return [row, col]
    }
    subscript(index: Int) -> Int {
        return tuple[index]
    }
    static func == (lhs: CellCoord, rhs: CellCoord) -> Bool {
           return
        lhs.tuple == rhs.tuple
    }
}

class Grid: ObservableObject {
    var columns: Int
    var rows: Int
    var path: String
    @Published var grid_content: [CellArr] = []
    var starting_point: CellCoord
    var destination: CellCoord
    
    subscript(row: Int, col:Int) -> Cell {
        get {
            return grid_content[row][col]
        }
       set {
           grid_content[row][col] = newValue
        }
        
    }

    init(colNum: Int, rowNum: Int, input_path: String, start_coords: CellCoord, end_coords: CellCoord) {
        rows = rowNum
        columns = colNum
        path = input_path
        starting_point = start_coords
        destination = end_coords
        var str_index = 0
        for row in 0...(rowNum - 1) {
            var newRow = CellArr()
            for col in 0...(colNum - 1) {
                let cell_symbol = input_path[str_index] == "X" ? "X" : "O"
                newRow.collection.append(Cell(symbol: cell_symbol, traveled: false, coord: CellCoord(row: row, col: col)))
                str_index += 1
            }
            grid_content.append(newRow)
        }
        grid_content[starting_point[0]][starting_point[1]].traveled = true
    }
    
    func getNextDirection(cur_row: Int, cur_col: Int) -> (direction:Double, valid_moves:[CellCoord]){
        //Scan for X's in all cardinal dir first
        //Choose the closest adj X
        //If no adj X pic cell closest to destination
        let top_nb = CellCoord(row: cur_row - 1, col:cur_col)
        let bot_nb = CellCoord(row: cur_row + 1, col: cur_col)
        let left_nb = CellCoord(row: cur_row, col: cur_col - 1)
        let right_nb = CellCoord(row: cur_row, col: cur_col + 1)
        let possible_moves: [CellCoord] = [top_nb, bot_nb, left_nb, right_nb]
        var valid_moves:[CellCoord] = []
        var on_track_moves:[CellCoord] = []
        
        for path in possible_moves {
            if 0...rows - 1 ~= path.row && 0...columns - 1 ~= path.col && !grid_content[path[0]][path[1]].traveled {
                if grid_content[path[0]][path[1]].symbol == "X" {
                    on_track_moves.append(path)
                }
                valid_moves.append(path)
            }
        }
        
        var best_move: CellCoord
        var best_weight: Int?
        var direction: Double
        
        if on_track_moves.count == 0 {
            best_move = valid_moves[0]
            for path in valid_moves {
                //Return the path with the least abs(difference between the two coords)
                let distance_weight = abs(path.row - destination[0]) + abs(path.col - destination[1])
                if best_weight == nil{
                    best_weight = abs(path.row - destination[0]) + abs(path.col - destination[1])
                }
                if best_weight! > distance_weight {
                    best_weight = distance_weight
                    best_move = path
                }
            }
        } else {
            best_move = on_track_moves[0]
            for path in on_track_moves {
                //Return the path with the least abs(difference between the two coords)
                let distance_weight = abs(path.row - destination[0]) + abs(path.col - destination[1])
                if best_weight == nil{
                    best_weight = abs(path.row - destination[0]) + abs(path.col - destination[1])
                }
                if best_weight! > distance_weight {
                    best_weight = distance_weight
                    best_move = path
                }
            }
        }
    

        switch(best_move) {
        case top_nb:
            direction = 0
        case bot_nb:
            direction = 180
        case left_nb:
            direction = -90
        case right_nb:
            direction = 90
        default:
            direction = 0
        }
        
        return (direction, valid_moves)
    }
}
