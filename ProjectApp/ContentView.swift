//
//  ContentView.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 2/23/22.
//

import RealityKit
import SwiftUI


struct ContentView: View {
    var body: some View {
        VStack {
            GridView()
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
