//
//  ContentView.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 2/23/22.
//

import RealityKit
import SwiftUI

struct SquareView: View {
    var body: some View {
        Text("Hello")
            .frame(minWidth: 60, minHeight: 60)
            .background(Color.gray)
            .padding(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4))
    }
}

struct GridView: View {
    let exGrid = Grid(cols: 4, rows: 4,path: "OXXOOOXOOXXOXOOOO")
    var body: some View {
       
        VStack {
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            SquareView()
            SquareView()
        }
    }
}

//
// struct ARViewContainer: UIViewRepresentable {
//
//    func makeUIView(context: Context) -> ARView {
//        return Arrow.shared.arViewp
//    }
//
//    func updateUIView(_ uiView: ARView, context: Context) {}
//
// }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
