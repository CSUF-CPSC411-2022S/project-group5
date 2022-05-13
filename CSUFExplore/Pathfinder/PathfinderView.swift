//
//  PathfinderView.swift
//  BFS-Showcase
//
//  Created by Zach Hofmeister on 5/9/22.
//

import SwiftUI
import Combine


struct firstView: View{
    var body: some View{
    VStack{
        Text("Welcome to the pathfinding app!").font(.title)
        Text("This app is to be used for navigation at CSUF")
        Image("csuf").resizable().scaledToFit().frame(width:400)
        }
    }
}
struct PathfinderView: View {
    
    @State var pathTiles:Array<MazeLocation> = []
    @State var currentPos:MazeLocation = MazeLocation(row: 0, col: 0)
    @State var selectedNumber:Int = 0
    @SceneStorage ("StartX") var startX : String = "0"
    @SceneStorage ("StartY") var startY: String = "0"
    @SceneStorage ("EndX") var EndX: String = "0"
    @SceneStorage ("EndY") var EndY: String = "0"
    var map:Array<Int> = [
        1, 1, 2, 2, 2, 2, 1, 1,
        1, 1, 2, 1, 1, 2, 1, 1,
        2, 2, 2, 1, 1, 2, 1, 1,
        1, 1, 2, 2, 2, 2, 1, 1,
        1, 1, 2, 1, 1, 2, 1, 1,
        2, 2, 2, 1, 1, 2, 1, 1,
        1, 1, 2, 2, 2, 2, 1, 1,
        1, 1, 2, 1, 1, 2, 1, 2
    ]
    
    var map2D = [
        [1, 1, 2, 2, 2, 2, 1, 1],
        [1, 1, 2, 1, 1, 2, 1, 1],
        [2, 2, 2, 1, 1, 2, 1, 1],
        [1, 1, 2, 2, 2, 2, 1, 1],
        [1, 1, 2, 1, 1, 2, 1, 1],
        [2, 2, 2, 1, 1, 2, 1, 1],
        [1, 1, 2, 2, 2, 2, 1, 1],
        [1, 1, 2, 1, 1, 2, 1, 1]
    ]
    
    func getNum(index:Int, innerIndex:Int) -> Int{
        let index = index*8+innerIndex
        print(index)
        return map[index]
    }
    
    func getColor(index:Int, innerIndex:Int) -> Color {
        let _index = index*8+innerIndex // Use this for green fill index * startX + startY
        var color:Color = .white
        
        if index%2 == 0 {
            color = _index%2 == 0 ? Color.purple : Color.orange
        }
        else {
            color = _index%2 != 0 ? Color.purple : Color.orange
        }
        
        // Classroom tiles (Orange = Engineering Building, Pink = CS Building)
        if _index == 0{
            color = Color.orange
        }
        if _index == 1{
            color = Color.orange
        }
        if _index == 9{
            color = Color.orange
        }
        if _index == 11{
            color = Color.pink
        }
        if _index == 12{
            color = Color.pink
        }
        if _index == 19{
            color = Color.pink
        }
        if _index == 20{
            color = Color.pink
        }
        if _index == 25{
            color = Color.orange
        }
        if _index == 32{
            color = Color.orange
        }
        if _index == 35{
            color = Color.pink
        }
        if _index == 36{
            color = Color.pink
        }
        if _index == 43{
            color = Color.pink
        }
        if _index == 44{
            color = Color.pink
        }
        if _index == 48{
            color = Color.orange
        }
        if _index == 57{
            color = Color.orange
        }
        if _index == 59{
            color = Color.pink
        }
        if _index == 60{
            color = Color.pink
        }
        // Fill in blank spots as white tiles
        if _index == 2{
            color = Color.white
        }
        
        if _index == 3{
            color = Color.white
        }
        
        if _index == 4{
            color = Color.white
        }
        
        if _index == 5{
            color = Color.white
        }
        
        if _index == 10{
            color = Color.white
        }
        if _index == 13{
            color = Color.white
        }
        if _index == 16{
            color = Color.white
        }
        if _index == 17{
            color = Color.white
        }
        if _index == 18{
            color = Color.white
        }
        
        if _index == 21{
            color = Color.white
        }
        if _index == 26{
            color = Color.white
        }
        if _index == 27{
            color = Color.white
        }
        if _index == 28{
            color = Color.white
        }
        if _index == 29{
            color = Color.white
        }
        if _index == 34{
            color = Color.white
        }
        if _index == 37{
            color = Color.white
        }
        if _index == 40{
            color = Color.white
        }
        if _index == 41{
            color = Color.white
        }
        if _index == 42{
            color = Color.white
        }
        if _index == 45{
            color = Color.white
        }
        if _index == 50{
            color = Color.white
        }
        if _index == 51{
            color = Color.white
        }
        if _index == 52{
            color = Color.white
        }
        if _index == 53{
            color = Color.white
        }
        if _index == 58{
            color = Color.white
        }
        if _index == 61{
            color = Color.white
        }
        
        // Parking lot tiles
        if _index == 6{
            color = Color.blue
        }
        if _index == 7{
            color = Color.blue
        }
        if _index == 14{
            color = Color.blue
        }
        if _index == 15{
            color = Color.blue
        }
        if _index == 22{
            color = Color.blue
        }
        if _index == 23{
            color = Color.blue
        }
        if _index == 30{
            color = Color.yellow
        }
        if _index == 31{
            color = Color.yellow
        }
        if _index == 38{
            color = Color.yellow
        }
        if _index == 39{
            color = Color.yellow
        }
        if _index == 46{
            color = Color.purple
        }
        if _index == 47{
            color = Color.purple
        }
        if _index == 54{
            color = Color.purple
        }
        if _index == 55{
            color = Color.purple
        }
        if _index == 62{
            color = Color.purple
        }
        if _index == 63{
            color = Color.purple
        }
        let EndX_string : Int = Int(EndX) ?? 0
        let EndY_string : Int = Int(EndY) ?? 0
        
        if _index == EndX_string * 8 + EndY_string {
            color = Color.red
        }
        let startX_string : Int = Int(startX) ?? 0
        let startY_string : Int = Int(startY) ?? 0
        
        if _index == startX_string * 8 + startY_string{
            color = Color.green
        }
        
        // check if part of path
        if self.pathTiles.contains(MazeLocation(row: index, col: innerIndex)) == true {
            color = Color.green
        }
        
        return color
    }
    
    func getPath(endPath:MazeLocation) {
        self.pathTiles.removeAll()
        let path = BFS().findPath(start:MazeLocation(row: Int(startX) ?? 0,col:Int(startY) ?? 0), end:MazeLocation(row:endPath.row,col:endPath.col))
        self.pathTiles = path
    }
    
    func findLegalMoves(step:Int) {
        let floodFill = FloodFill()
        // reset array of allowed blocks
        self.pathTiles.removeAll()
        
        for index in 0..<map2D.count {
            for innerIndex in 0..<map2D[index].count {
                floodFill.floodFill(row: index, col: innerIndex, step: step, teamPosition: self.currentPos)
            }
        }
        // all allowed moves
        let visited = floodFill.getVisited()
        
        // now check if they are valid
        for index in 0..<visited.count {
            for innerIndex in 0..<visited[index].count {
                if visited[index][innerIndex] == 2 {
                    
                    let path = BFS().findPath(start:MazeLocation(row: self.currentPos.row,col:self.currentPos.col), end:MazeLocation(row:index,col:innerIndex))
                    
                    if path.count-1 == step {
                        self.pathTiles.append(MazeLocation(row: index, col: innerIndex))
                    }
                }
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 0){
            Text("Welcome to the CSUF Pathfinding Function!")
            Text("This function will help you navigate the ECS section of campus")
            Text("Please input starting coordinates")
            TextField("Start point X", text: $startX)
            TextField("Start point Y", text: $startY)
            TextField("End point X", text: $EndX)
            TextField("End point Y", text: $EndY)
            ForEach(0..<8, id: \.self) { index in // ZStack
                HStack(spacing: 0){
                    ForEach(0..<8, id: \.self) { innerIndex in
                        if getNum(index: index, innerIndex: innerIndex) == 1 || getNum(index: index, innerIndex: innerIndex) == 2 {
                            ZStack(alignment: .center){
                                
                                RoundedRectangle(cornerRadius: 10).fill(getColor(index:index, innerIndex:innerIndex)).frame(width: 40, height: 40, alignment: .center)
                            }.id(index*innerIndex).onTapGesture {
                                getPath(endPath: MazeLocation(row: index, col: innerIndex))
                            }
                        }
                        
                        else {
                            ZStack(alignment: .center){
                                RoundedRectangle(cornerRadius: 10).fill(Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0)).frame(width: 40, height: 40, alignment: .center)
                            }.id(index*innerIndex)
                        }
                    }
                }.id(index)
                
                    
            }
            VStack{
                Text("Key: ")
                Text("💙 = E Parking")
                Text("💛 = Faculty Parking")
                Text("💜 = East Parking Structure")
                Text("🧡 = Engineering Building")
                Text("💗 = Computer Science Building")
                Text("🤍 = Walkable Path")
                Text("Don't forget to check the weather!")
            }
            
        }
            
    }
    
}
