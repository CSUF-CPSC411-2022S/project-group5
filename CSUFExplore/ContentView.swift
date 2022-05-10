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
                    
                    GeometryReader { geometry in
                        HStack {
                            Image("long")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height:100)
                                .padding(.top,-120)
                                
                        }
                    }.frame(width: 100, height: 100, alignment: .center)
                    //Spacer()
                    VStack{
                        
                        Text("Welcome to CSUF Explore!")
                            .fontWeight(.bold)
                            .modifier(WelcomeToAppName())
                            .padding(.top, -90)
                        HStack {
                            Spacer()
                            Text("Name: ").modifier(NameText()).padding(.top, -50)
                            TextField("Name", text: $name).padding(.top, -35)
                        }
                        HStack {
                            Spacer()
                            Text("Major: ").modifier(MajorText()).padding(.top, -30)
                            TextField("Major", text: $major).padding(.top, -24)
                            
                        }
                        
                        
                    }
                    
                    GeometryReader { geometry in
                    VStack{
                        Text("★..Tour Pass..★" )
                            .fontWeight(.bold)
                            .modifier(TourPass())
                        VStack {
                            Text("Virtual Tour | CSUF")
                                .fontWeight(.bold)
                                .modifier(TitleText())
                            HStack {
                                //Text("🤓").modifier(emojiText())
                                Image("tuffy")
                                    .resizable()
                                    .scaledToFit()
                                    .clipShape(Circle())
                                    .frame(width: 70, height:70)
                                    .padding(.top,-10)
                                    //.background(Color.yellow)
                                    .hueRotation(Angle(degrees:-98))
                                
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
                        NavigationLink(destination: AppInfo()) {
                            Text("Begin the Tour").font(.footnote).modifier(ButtonDesign())
                        }
                        Spacer()
                        //frame for tourPass section
                    }.frame(height: geometry.size.height/2.4)
                    
                    
                }
                
               //frame for whole screen
                }.frame(height: geometry.size.height/1)
        }
        }
        
    }

struct WelcomeToAppName: ViewModifier {
   func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
          
           .padding()
           .foregroundColor(Color.white)
           
           .background(Color.yellow)
           //.padding(.top,20)
           .cornerRadius(30)
           .hueRotation(Angle(degrees: -43))
   }
}

struct TourPass: ViewModifier {
   func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 16))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.green)
           .cornerRadius(10)
           .padding(.top,200)
           .hueRotation(Angle(degrees: 90))
   }
}
//emoji custom view modifier
struct emojiText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 40))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.green)
           .cornerRadius(60)
           //.grayscale(/*@START_MENU_TOKEN@*/1.5/*@END_MENU_TOKEN@*/)
           .hueRotation(Angle(degrees: 90))
           
    }
}
//"Virtual Tour| CSUF" text in the ID sample box
struct TitleText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.custom("Courier New", size: 13))
            .font(Font.headline)
           .foregroundColor(Color.white)
           .padding()
           .background(Color.yellow)
           .cornerRadius(10)
           .hueRotation(Angle(degrees: -140))
    }
}



//modifier for the generated ID tag
struct IdSampleText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 15))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.green)
           .cornerRadius(10)
           .padding(15)
           .hueRotation(Angle(degrees: 90))
    }
}

// modifiers for what's under "tourforAppname" section
struct NameText: ViewModifier {
    func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
           .foregroundColor(Color.black)
           .padding()
          // .padding(.top, 20)
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
