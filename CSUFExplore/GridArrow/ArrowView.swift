//
//  ArrowView.swift
//  ProjectApp
//
//  Created by Jacob Nguyen on 5/9/22.
//

import Foundation
import SwiftUI

struct ArrowView: View {
    var direction: Double
    var body: some View {
        Arrow().fill(.black).frame(width: 60, height: 60).background(Color.yellow).rotationEffect(.degrees(direction))
    }
}
