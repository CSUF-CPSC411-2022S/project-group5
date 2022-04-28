//
//  AppInfoViews.swift
//  ProjectApp
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
    @State var info = [Element(name: "AR Buildings", description: "add detailed info later"),
        Element(name: "3D Model", description: "add detailed info later"),
        Element(name: "Path Finder",description: "add detailed info later")
    ]
    var body: some View {
        NavigationView {
            
            VStack {
                TextField("Search", text: $search)
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
                            Text("\(element.name)")//.modifier(TourPass())
                        }
                    } else {
                        Text("\(element.name)")
                    }
                }
                //Spacer()
                TabView{
                    //our three features' tabview
                    AppInfo()// will change to teammate's struct/class
                        .tabItem{ //for ARbuilding
                            Image(systemName:"building")
                            Text("AR Building")
                        }
                        //for 3D Model
                        .tabItem{
                            Image(systemName:"square.stack.3d.up")
                            Text("3D Model")
                        }
                        //for path finding
                        .tabItem{
                            Image(systemName:"arrow.swap")
                            Text("Path Finder")
                        
                        }
                            
                       
                    
                }
            }
        }
    }
}



