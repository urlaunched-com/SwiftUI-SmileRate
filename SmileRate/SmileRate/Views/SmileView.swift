//
//  SmileView.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import SwiftUI

struct SmileView: View {
    
    var selectedRating: StarRating
    var lineWidth: CGFloat = 15
    var expressionAmount: CGFloat = 10
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        smileView
            // Excellent rating animation
            .offset(y: selectedRating == .excellent ? screenWidth / (-1 * expressionAmount) : 0)
            .frame(width: screenWidth * 0.8)
            .animation(.spring(response: 0.6))
            // Start animation
            .rotation3DEffect(
                .init(degrees: selectedRating == .none ? 180 : 0),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .animation(.spring(response: 0.6, dampingFraction: 0.4))
            // Awful rating animation
            .scaleEffect(selectedRating == .awful ? 2 : 1)
            .rotation3DEffect(
                .init(degrees: selectedRating == .awful ? Double(-1 * expressionAmount * 2.5) : 0),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .offset(x: 0, y: selectedRating == .awful ? expressionAmount * 2 : 0)
            .animation(.easeInOut(duration: 1.5))
            // Bad rating animation
            .rotation3DEffect(
                .init(degrees: selectedRating == .bad ? Double(expressionAmount) : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .animation(selectedRating == .bad ? .default.repeatCount(5, autoreverses: true) : nil)
            // Good rating animation
            .rotation3DEffect(
                .init(degrees: selectedRating == .good ? Double(-1 * expressionAmount) : 0),
                axis: (x: 1.0, y: 0.0, z: 0.0)
            )
            .offset(x: 0, y: selectedRating == .good ? expressionAmount * 2 : 0)
            .animation(selectedRating == .good ? .default.repeatCount(5, autoreverses: true) : nil)
    }
    
    var smileView: some View {
        Circle()
            .fill(selectedRating.faceColor)
            .animation(.easeInOut(duration: 0.7))
            .aspectRatio(contentMode: .fit)
            .shadow(color: selectedRating == .none ? .clear : .black.opacity(0.15), radius: 5, x: 0, y: 5)
            .overlay(
                faceView
                    .opacity(selectedRating == .none ? 0 : 1)
                    .offset(y: selectedRating == .average ? screenWidth / (expressionAmount * 1.5) : 0)
                    .offset(y: selectedRating == .bad ? screenWidth / (expressionAmount * -2) : 0)
            )
    }
    
    var faceView: some View {
        VStack(spacing: 0) {
            Spacer()
            eyesView
            HStack {
                cheekView
                Spacer()
                cheekView
            }
            .padding(.horizontal, screenWidth / 10)
            mouthView
            Spacer()
        }
    }
    
    var eyesView: some View {
        HStack(spacing: 0) {
            VStack(spacing: 0) {
                EyeBrowView(side: .left, selectedRating: selectedRating, lineWidth: lineWidth)
                EyeView(side: .left, selectedRating: selectedRating, lineWidth: lineWidth)
                    .scaleEffect(selectedRating == .average ? 1.2 : 1)
            }
            VStack(spacing: 0) {
                EyeBrowView(side: .right, selectedRating: selectedRating, lineWidth: lineWidth)
                EyeView(side: .right, selectedRating: selectedRating, lineWidth: lineWidth)
                    .scaleEffect(selectedRating == .average ? 0.6 : 1)
            }
        } 
    }
    
    var cheekView: some View {
        Circle()
            .fill(Color.clear)
            .frame(width: 1, height: 1)
            .overlay(
                Circle()
                    .stroke(
                        selectedRating.cheekColor,
                        style: StrokeStyle(lineWidth: screenWidth / 10, lineCap: .round, lineJoin: .round)
                    )
            )
    }
    
    var mouthView: some View {
        Mouth(smileAmount: selectedRating.smileAmount)
            .stroke(
                Color.background,
                style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
            )
            .frame(
                width: selectedRating == .average || selectedRating == .excellent ? screenWidth / 6 : screenWidth / 3,
                height: screenWidth / 4
            )
            .offset(y: selectedRating == .awful || selectedRating == .bad ? -1 * expressionAmount : 0)
            .shadow(
                color: selectedRating == .awful || selectedRating == .bad ? .black.opacity(0.35) : .black.opacity(0.15),
                radius: 5, x: 0, y: 5
            )
    }
}

struct SmileView_Previews: PreviewProvider {
    static var previews: some View {
        SmileView(selectedRating: .none, lineWidth: 10)
    }
}
