//
//  ContentView.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapForm()
    }
}

struct MapForm: View {
    @StateObject var agent = MapAgent()
    
    var body: some View {
        VStack {
            Text("Map Form")
                .font(.headline)
            HStack {
                Text("Latitude:")
                TextField("Latitude", text: $agent.strLatitude)
                Spacer()
            }
            HStack {
                Text("Longitude:")
                TextField("Longitude", text: $agent.strLongitude)
                Spacer()
            }
            HStack {
                Text("Direction:")
                TextField("Direction", text: $agent.strDirection)
                Spacer()
            }
            MapAgentReport(agent: agent)
        }
    }
}

struct MapAgentReport: View {
    @ObservedObject var agent: MapAgent
    
    var body: some View {
        VStack {
            HStack {
                Text("Latitude: \(agent.latitude)")
                Text("Longitude: \(agent.longitude)")
            }
            Text("Direction: \(agent.direction)")
        }.padding().background(Color.blue)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
