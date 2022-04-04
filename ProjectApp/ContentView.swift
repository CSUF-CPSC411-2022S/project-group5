//
//  ContentView.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 2/23/22.
//

import SwiftUI


struct ContentView: View {
    @State var name: String = ""
    @State var major: String = ""
    @State var Id_sample: String = " "
            
            
            
    var body: some View {
        // TODO: Enclose this entire VStack with GeometryReader in Model 3
        
        
        GeometryReader { geometry in
            VStack {
                // TODO: Add frame method call to this VStack in Model 3
                VStack {
                    //Text("SafeWalk Volunteer")//.font(.headline)
                    Text("Welcome to AppName :)")
                        .fontWeight(.bold)
                        .modifier(TourforAppName())

                    
                    HStack {
                        Spacer()
                        Text("Name: ").modifier(NameText())
                        TextField("Name", text: $name)
                        Spacer()
                    }
                    
                    HStack {
                        Spacer()
                        Text("Major: ").modifier(MajorText())
                        TextField("Major", text: $major)
                        Spacer()
                    }
                    
                    
                    // starting point for ID sample display
                    VStack {
                        Text("Tour Pass" )
                            .fontWeight(.bold)
                            .modifier(TourforAppName())
                        
                    }
                    
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
                        
                        
                }
            }.frame(height: geometry.size.height / 1)
                Spacer()
                
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TourforAppName: ViewModifier {
   func body(content: Content) -> some View {
        content
           .font(.custom("Courier New", size: 20))
           .foregroundColor(Color.white)
           .padding()
           .background(Color.gray)
           .cornerRadius(10)
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
           .cornerRadius(10)
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

