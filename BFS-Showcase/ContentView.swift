//
//  ContentView.swift
//  BFS-Showcase
//
//  Created by Mixalis Dobekidis on 24/1/21.
//

import SwiftUI
import Combine


struct ContentView: View{
    var body: some View{
    VStack{
        TabView{
            firstView()
                .tabItem{
                    Image(systemName: "info")
                    Text("First")
                    
                }
            PathfinderView()
                .tabItem{
                    Image(systemName: "car")
                    Text("Pathfinding")
                }
        }
    }
    }
}

struct firstView: View{
    var body: some View{
    VStack{
        Text("Welcome to the pathfinding app!").font(.title)
        Text("This app is to be used for navigation at CSUF")
        Image("csuf").resizable().scaledToFit().frame(width:400)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
