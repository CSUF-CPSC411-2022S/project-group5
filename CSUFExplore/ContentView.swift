//
//  ContentView.swift
//  CSUFExplore
//
//  Created by Zach Hofmeister on 2/23/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ProfileScreen()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
            NearbyBuildingsTour()
                .tabItem {
                    Image(systemName: "mappin.and.ellipse")
                    Text("Nearby")
                }
            PathfinderView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Paths")
                }
            GridView()
                .tabItem {
                    Image(systemName: "arrow.up.right.diamond")
                    Text("Directions")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}

struct ProfileScreen: View {
    @SceneStorage("name") var name: String = ""
    @SceneStorage("major") var major: String = ""
    @SceneStorage("Id_sample") var Id_sample: String = " "
    //use for the navagation link
    @State private var go_to_next = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack {
                    Text("Welcome to CSUF Explore!")
                        .fontWeight(.bold)
                        .modifier(WelcomeToAppName())
                    HStack {
                        Spacer()
                        Text("Name: ").modifier(NameText())
                        TextField("Name", text: $name)
                    }
                    HStack {
                        Spacer()
                        Text("Major: ").modifier(MajorText())
                        TextField("Major", text: $major)
                        
                    }
                    
                    // starting point for ID sample display
                    Text("🌟Tour Pass🌟" )
                        .fontWeight(.bold)
                        .modifier(TourPass())
                    
                    VStack {
                        Text("Virtual Tour | CSUF")
                            .fontWeight(.bold)
                            .modifier(TitleText())
                        HStack {
                            Text("🤓").modifier(emojiText())
                            VStack{
                                HStack {
                                    Spacer()
                                    TextField("Name", text: $name)
                                    Spacer()
                                }
                                HStack {
                                    Spacer()
                                    Text("Major: ").fontWeight(.bold)
                                    TextField("Major", text:$major)
                                    Spacer()
                                }
                            }
                        }
                    }.modifier(IdSampleText())
                    
                    //adding "starting tour button", going to next page once clicked
                    NavigationLink(destination: AppInfo()) {
                        Text("Begin the Tour").font(.footnote).modifier(ButtonDesign())
                    }
                    Spacer()
                }.frame(height: geometry.size.height / 1)
                Spacer()
            }
        }
    }

struct WelcomeToAppName: ViewModifier {
   func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.black)
           .cornerRadius(10)
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
//emoji custom view modifier
struct emojiText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 40))
           .foregroundColor(Color.black)
           .padding()
           .background(Color.brown.brightness(10))
           .cornerRadius(60)
           .grayscale(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/)
           .hueRotation(Angle(degrees: 40))
           
    }
}
//"Virtual Tour| CSUF" text in the ID sample box
struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Courier New", size: 15))
            .font(Font.headline)
           .foregroundColor(Color.white)
           .padding()
           //.background(Color.black)
           .cornerRadius(10)
    }
}



//modifier for the generated ID tag
struct IdSampleText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 15))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.brown)
           .cornerRadius(10)
           .padding(15)
           .hueRotation(Angle(degrees: 50))
    }
}

// modifiers for what's under "tourforAppname" section
struct NameText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
           .foregroundColor(Color.black)
           .padding()
           .cornerRadius(10)
    }
}


struct MajorText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
           .foregroundColor(Color.black)
           .padding()
           .cornerRadius(10)
    }
}

}

struct ButtonDesign: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(10)
            
    }
}
