//  ProjectApp
//
//  Created by Jacob Nguyen on 2/24/22.

//Latitude is always first

import Foundation
import RealityKit
import SwiftUI
import Combine

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
            Path { path in
                let width = rect.width
                let height = rect.height
                
                path.addLines( [
                    CGPoint(x: width * 0.4, y: height),
                    CGPoint(x: width * 0.4, y: height * 0.4),
                    CGPoint(x: width * 0.2, y: height * 0.4),
                    CGPoint(x: width * 0.5, y: height * 0.1),
                    CGPoint(x: width * 0.8, y: height * 0.4),
                    CGPoint(x: width * 0.6, y: height * 0.4),
                    CGPoint(x: width * 0.6, y: height)
                    
                ])
                path.closeSubpath()
            }
    }
}

class ArrowController: ObservableObject {
    enum Directions {
        case North
        case South
        case East
        case West
    }
    
//  AR members
//    static var shared = Arrow()
//    @Published var arView: ARView!
//    @Published var enableAR = false
//    @Published var xTranslation: Float = 0 {
//        didSet{translateArrow()}
//    }
//    @Published var yTranslation: Float = 0 {
//        didSet{translateArrow()}
//    }
//    @Published var zTranslation: Float = 0 {
//        didSet{translateArrow()}
//    }
    
    var Coords: [String: [Float]] = [:]
    var LatDir: Directions {
        get {
            if Coords["AnchorOne"]![0] + Coords["AnchorTwo"]![0] < 0 {
                return Directions.West
            }
            return Directions.East
        }
    }
    var LongDir: Directions {
        get {
            if Coords["AnchorOne"]![1] + Coords["AnchorTwo"]![1] < 0 {
                return Directions.South
            }
            return Directions.North
        }
    }
    init(anchorOne: [Float], anchorTwo: [Float]){
        Coords["AnchorOne"] = anchorOne
        Coords["AnchorTwo"] = anchorTwo
    }
    
   
//    AR Functions
//    init(){
//        arView = ARView(frame: .zero)
//        let boxAnchor = try! Experience.loadBox()
//        arView.scene.anchors.append(boxAnchor)
//    }
//    func translateArrow(){
//        if let arrowYellow = (arView.scene.anchors[0] as? Experience.Box)?.arrowYellow {
//            let xTranslationM = xTranslation / 100
//            let yTranslationM = yTranslation / 100
//            let zTranslationM = zTranslation / 100
//
//            let translation = SIMD3<Float>(xTranslationM, yTranslationM, zTranslationM)
//            arrowYellow.transform.translation = translation
//        }
//    }
}

