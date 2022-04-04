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

struct AppInfoOutline: View {
    
    @State var info = [
        Element(name: "AR Buildings", description: "add detailed info later"),
        Element(name: "3D Model", description: "add detailed info later"),
        Element(name: "Path Finder",description: "add detailed info later")
    ]
    var body: some View {
        NavigationView {
            VStack {
                List(info) {
                    element in
                    if let description = element.description {
                        NavigationLink(destination: Text(description)) {
                            Text("\(element.name)")
                        }
                    } else {
                        Text("\(element.name)")
                    }
                }
                Spacer()
            }
        }
    }
}

struct TourPass: ViewModifier {
   func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.brown)
           .cornerRadius(10)
           .padding(.top, 120.0)
           .hueRotation(Angle(degrees: 50))
   }
}
