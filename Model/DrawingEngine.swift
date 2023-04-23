//
//  SwiftUIView.swift
//  
//
//  Created by 하명관 on 2023/04/08.
//

import Foundation
import SwiftUI

class DrawingEngine {
    
    func createPath(for points: [CGPoint]) -> Path {
        var path = Path()
        
        if let firstPoint = points.first {
            path.move(to: firstPoint)
        }
        
        for index in 1..<points.count {
            let mid = calculateMidPoint(points[index - 1], points[index])
            path.addQuadCurve(to: mid, control: points[index - 1])
        }
        
        if let last = points.last {
            path.addLine(to: last)
        }
        
        return path
    }
    
    
    
    func calculateMidPoint(_ point1: CGPoint, _ point2: CGPoint) -> CGPoint {
        let newMidPoint = CGPoint(x: (point1.x + point2.x)/2, y: (point1.y + point2.y)/2)
        return newMidPoint
    }
}

struct DrawingShape: Shape {
    let points: [CGPoint]
    let engine = DrawingEngine()
    func path(in rect: CGRect) -> Path {
        engine.createPath(for: points)
    }
}

struct Line: Identifiable {
    
    var points: [CGPoint]
    var color: Color
    var lineWidth: CGFloat

    let id = UUID()
}
