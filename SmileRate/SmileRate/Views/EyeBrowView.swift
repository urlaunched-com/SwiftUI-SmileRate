//
//  EyeBrowView.swift
//  SmileRate
//
//  Created by Alexander Sharko on 01.10.2021.
//

import SwiftUI

struct EyeBrowView: View {
    
    var side: FaceSide
    var selectedRating: StarRating
    var lineWidth: CGFloat
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        EyeBrow(side: side, smileAmount: selectedRating.smileAmount)
            .stroke(
                Color.background,
                style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
            )
            .aspectRatio(2/1, contentMode: .fit)
            .frame(width: screenWidth / 4)
            .offset(y: selectedRating == .excellent ? screenWidth / -15 : 0)
            .offset(y: selectedRating == .awful ? screenWidth / 20 : 0)
            .shadow(
                color: selectedRating == .awful || selectedRating == .bad ? .black.opacity(0.35) : .black.opacity(0.15),
                radius: 5, x: 0, y: 5
            )
    }
}

struct EyeBrowView_Previews: PreviewProvider {
    static var previews: some View {
        EyeBrowView(side: .left, selectedRating: .none, lineWidth: 15)
    }
}


