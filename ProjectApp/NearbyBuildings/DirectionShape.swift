//
//  DirectionShape.swift
//  ProjectApp
//
//  Created by Zach Hofmeister on 4/21/22.
//

import Foundation
import SwiftUI

struct DirectionTri : Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.maxX, y: rect.maxY * 1/2))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX * 1/4, y: rect.maxY * 1/2))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY * 1/2))
        return path
    }
}
