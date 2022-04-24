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

struct idBoolArr:Identifiable {
    var id = UUID()
    var boolArr: [Bool]
    
    init(_ repeating_: Bool, _ count_:Int){
        boolArr = Array(repeating: repeating_, count: count_)
    }
}

class Grid {
    var columns: Int
    var rows: Int
    var path: String
    var grid_path: [idBoolArr]{
        get {
            var gen_grid = Array(repeating: idBoolArr(false, columns), count: rows)
            var str_index = 0
            for (i, row) in gen_grid.enumerated(){
                for (j, _) in row.boolArr.enumerated(){
                    gen_grid[i].boolArr[j] = path[str_index] == "X" ? true : false
                    str_index+=1
                }
            }
            return gen_grid
        }
    }
    
    init(cols:Int, rows:Int, path:String){
        self.rows = rows
        self.columns = cols
        self.path = path
    }
    
    func genGrid() -> some View {
        for (i, row) in grid_path.enumerated(){
            for (j, _) in row.boolArr.enumerated(){
                return VStack{
                    
                }
            }
        }
    }
    
}

