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

class Grid {
    var columns: Int
    var rows: Int
    var path: String
    var grid_path: [[Bool]]{
        set {
            self.grid_path = Array(repeating: Array(repeating: false, count: columns), count: rows)
        }
        get {
            var str_index = 0
            for (i, row) in self.grid_path.enumerated(){
                for (j, _) in row.enumerated(){
                    self.grid_path[i][j] = path[str_index] == "X" ? true : false
                    str_index+=1
                }
            }
            print(self.grid_path)
            return self.grid_path
        }
    }
    
    init(cols:Int, rows:Int, path:String){
        self.rows = rows
        self.columns = cols
        self.path = path
    }
    
}

