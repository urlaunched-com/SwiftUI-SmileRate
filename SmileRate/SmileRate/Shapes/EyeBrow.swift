//
//  EyeBrow.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import SwiftUI

struct EyeBrow: Shape {
    
    var side: FaceSide
    var smileAmount: CGFloat
    
    var animatableData: CGFloat {
        get { smileAmount }
        set { self.smileAmount = newValue }
    }
    
    var sideСoefficient: CGFloat {
        side == .left ? 1 : -1
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(
            to: CGPoint(
                x: rect.minX + 10,
                y: rect.midY + (smileAmount * 0.6 * sideСoefficient)
            )
        )
        path.addCurve(
            to: CGPoint(
                x: rect.maxX - 10,
                y: rect.midY - (smileAmount * 0.6 * sideСoefficient)
            ),
            control1: CGPoint(
                x: rect.midX / 2,
                y: rect.minY - smileAmount * 0.2
            ),
            control2: CGPoint(
                x: rect.midX + rect.midX / 2,
                y: rect.minY - smileAmount * 0.2
            )
        )
        return path
    }
}

struct EyeBrow_Previews: PreviewProvider {
    static var previews: some View {
        EyeBrow(
            side: .left,
            smileAmount: -50
        )
        .stroke(
            Color.regularYellow,
            style: StrokeStyle(lineWidth: 25, lineCap: .round, lineJoin: .round)
        )
        .padding(30)
    }
}
