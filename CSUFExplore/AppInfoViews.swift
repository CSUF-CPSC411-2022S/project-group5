//
//  AppInfoViews.swift
//  CSUFExplore
//
//  Created by Summer on 4/3/22.
//

import SwiftUI



struct Element: Identifiable {
    var id = UUID()
    var name: String
    var description: String?
}



// to display the outline
struct AppInfo: View {
    
    @State var search = ""
    @State var info = [Element(name: "AR Buildings", description: "This feature will provide you with information on the buildings that you are looking at."),
        Element(name: "3D Model", description: "add detailed info later"),
        Element(name: "Path Finder",description: "This feature provides you with a map of the engineering section of CSUF and also gives navigation to each building")
    ]
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Search", text: $search).padding(.top, -120)
                //List{
                    //ForEach(info){
                        //element in
                        //if element.name == search {
                            //Text(element.name)
                        //}
                        
                    //}
               // }
                List(info) {
                    element in
                    if let description = element.description {
                        NavigationLink(destination: Text(description)) {
                            Text("\(element.name)").padding(.top,-10)
                        }
                    } else {
                        Text("\(element.name)").padding(.top,-10)
                    }
                }
                //Spacer()
                //TabView{
                    //our three features' tabview
                    //AppInfo()// will change to teammate's struct/class
                        //.tabItem{ //for ARbuilding
                            //Image(systemName:"building")
                            //Text("AR Building")
                        //}
                        //for 3D Model
                        //.tabItem{
                            //Image(systemName:"square.stack.3d.up")
                            //Text("3D Model")
                        //}
                        //for path finding
                        //.tabItem{
                            //Image(systemName:"arrow.swap")
                            //Text("Path Finder")
                        
                       // }
                            
                Image("map2")
                    .resizable()
                    //.scaledToFit()
                    .frame(width: 180, height: 260)
                    //.overlay(Circle().stroke(lineWidth:3)
                    //.foregroundColor(.gray))
                    .rotationEffect(.degrees(90))
                    //.clipShape(Circle())
                    
                }
            }
        }
   
    }



