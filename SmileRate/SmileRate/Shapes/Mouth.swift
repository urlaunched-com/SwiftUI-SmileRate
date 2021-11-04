//
//  Mouth.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import SwiftUI

struct Mouth: Shape {
    
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
                x: rect.midX / 2,
                y: rect.midY + smileAmount
            ),
            control2: CGPoint(
                x: rect.midX + rect.midX / 2,
                y: rect.midY + smileAmount
            )
        )
        path.addCurve(
            to: CGPoint(
                x: rect.minX,
                y: rect.midY
            ),
            control1: CGPoint(
                x: rect.midX + rect.midX / 2,
                y: rect.midY + smileAmount
            ),
            control2: CGPoint(
                x: rect.midX / 2,
                y: rect.midY + smileAmount
            )
        )
        return path
    }
}

struct Mouth_Previews: PreviewProvider {
    static var previews: some View {
        Mouth(smileAmount: -25)
            .stroke(
                Color.regularYellow,
                style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round)
            )
            .aspectRatio(contentMode: .fit)
            .padding(30)
    }
}
