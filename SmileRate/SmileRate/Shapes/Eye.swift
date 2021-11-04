//
//  Eye.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import SwiftUI

struct Eye: Shape {
    
    var smileAmount: CGFloat
    
    var animatableData: CGFloat {
        get { smileAmount }
        set { self.smileAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(
                x: rect.minX,
                y: rect.midY
            )
        )
        path.addCurve(
            to: CGPoint(
                x: rect.maxX,
                y: rect.midY
            ),
            control1: CGPoint(
                x: rect.minX,
                y: rect.minY - smileAmount * 0.3
            ),
            control2: CGPoint(
                x: rect.maxX,
                y: rect.minY - smileAmount * 0.3
            )
        )
        path.addCurve(
            to: CGPoint(
                x: rect.minX,
                y: rect.midY
            ),
            control1: CGPoint(
                x: rect.maxX,
                y: rect.maxY + smileAmount * 0.3
            ),
            control2: CGPoint(
                x: rect.minX,
                y: rect.maxY + smileAmount * 0.3
            )
        )
        return path
    }
}

struct Eye_Previews: PreviewProvider {
    static var previews: some View {
        Eye(smileAmount: -50)
            .stroke(
                Color.regularYellow,
                style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round)
            )
            .padding(30)
    }
}
