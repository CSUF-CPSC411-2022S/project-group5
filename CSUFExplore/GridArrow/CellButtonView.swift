//
//  CellButtonView.swift
//  ProjectApp
//
//  Created by Jacob Nguyen on 5/9/22.
//

import Foundation
import SwiftUI

struct CellButton: View {
    @EnvironmentObject var exGrid: Grid
    @Binding var cur_coord: CellCoord
    var didTap: Bool
    let symbol: String
    let coord: CellCoord
    
    @ViewBuilder var isArrowCell: some View {
        if coord == cur_coord {
            if coord == exGrid.destination {
                Text(symbol)
                    .frame(minWidth: 60, minHeight: 60)
                    .background(Color.green).foregroundColor(Color.black)
            } else {
                ArrowView(direction: exGrid.getNextDirection(cur_row: cur_coord[0], cur_col: cur_coord[1]).direction)
            }
        } else {
            Text(symbol)
                .frame(minWidth: 60, minHeight: 60)
                .background(didTap ? Color.yellow : Color.gray).foregroundColor(Color.black)
        }
    }
    
    var body: some View {
        Button {
            exGrid.grid_content[coord[0]][coord[1]].traveled = true
            cur_coord = CellCoord(row: coord[0], col: coord[1])
        } label: {
            isArrowCell
        }
        .contentShape(Rectangle())
    }
}
