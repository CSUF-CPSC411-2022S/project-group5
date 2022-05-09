//
//  GridView.swift
//  ProjectApp
//
//  Created by Jacob Nguyen on 5/9/22.
//

import Foundation
import SwiftUI

struct GridView: View {
    @StateObject var exGrid = Grid(colNum: 6, rowNum: 6, input_path: "XXXOOOOOXXXXOOOOOXOOOXXXOOOXOOOOOXXX", start_coords: CellCoord(row: 0, col: 0), end_coords: CellCoord(row: 5,col: 5))
    @State var cur_coord: CellCoord = CellCoord(row: 0, col: 0)
    var body: some View {
        VStack {
            ForEach(exGrid.grid_content) {
                row in
                HStack {
                    ForEach(row.collection) {
                        cell in
                        CellButton(cur_coord: $cur_coord, didTap: cell.traveled, symbol: cell.symbol, coord: cell.coord)
                    }
                }
            }
            Button {
                for row in 0...(exGrid.rows - 1) {
                    for col in 0...(exGrid.columns - 1) {
                        exGrid.grid_content[row][col].traveled = false
                    }
                }
                cur_coord = CellCoord(row: 0, col: 0)
                exGrid.grid_content[exGrid.starting_point[0]][exGrid.starting_point[1]].traveled = true
            } label: {
                Text("Reset")
                    .frame(minWidth: 60, minHeight: 60).foregroundColor(Color.blue)
            }
        }.environmentObject(exGrid)
    }
}
