//
//  EyeView.swift
//  SmileRate
//
//  Created by Alexander Sharko on 01.10.2021.
//

import SwiftUI

struct EyeView: View {
    
    var side: FaceSide
    var selectedRating: StarRating
    var lineWidth: CGFloat
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        Eye(smileAmount: selectedRating.smileAmount)
            .stroke(
                Color.background,
                style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round)
            )
            .frame(width: screenWidth / 7, height: screenWidth / 7)
            .aspectRatio(contentMode: .fit)
            .scaleEffect(
                selectedRating == .excellent || selectedRating == .average ? 0 : 1
            )
            .animation(.spring(response: 0.6))
            .overlay(eyeHeartView)
            .shadow(
                color: selectedRating == .awful || selectedRating == .bad ? .black.opacity(0.35) : .black.opacity(0.15),
                radius: 5, x: 0, y: 5
            )
            .animation(.spring(response: 0.3, dampingFraction: 0.4))
            .background(eyeBallView)
    }
    
    var eyeBallView: some View {
        Eye(smileAmount: selectedRating.smileAmount)
            .fill(Color.white)
            .scaleEffect(selectedRating == .average || selectedRating == .excellent ? 0 : 1)
            .overlay(pupilView, alignment: side == .left ? .bottomTrailing : .bottomLeading)
    }
    
    var pupilView: some View {
        Circle()
            .fill(selectedRating == .average ? Color.background : Color.black)
            .frame(width: screenWidth / 15)
            .padding(.horizontal, selectedRating == .awful ? lineWidth / 3 : lineWidth)
            .scaleEffect(
                x: selectedRating == .awful ? 0.2 : 1,
                y: selectedRating == .awful ? 0.6 : 1
            )
            .offset(y: selectedRating == .awful ? lineWidth / -3 : 0)
            .offset(y: selectedRating == .bad ? lineWidth / 3 : 0)
            .shadow(
                color: selectedRating == .average ? .black.opacity(0.15): .clear,
                radius: 5, x: 0, y: 5
            )
            .overlay(eyeReflectionView, alignment: .trailing)
    }
    
    var eyeReflectionView: some View {
        Circle()
            .fill(selectedRating == .awful || selectedRating == .average ? Color.clear :Color.white.opacity(0.4))
            .frame(width: screenWidth / 15 / 3)
            .scaleEffect(x: 0.3)
            .padding(.horizontal, selectedRating == .awful ? lineWidth / 3 / 6 : lineWidth)
            .scaleEffect(
                x: selectedRating == .awful ? 0.2 : 1,
                y: selectedRating == .awful ? 0.6 : 1
            )
            .offset(y: selectedRating == .awful ? lineWidth / -3 : 0)
            .offset(y: selectedRating == .bad ? lineWidth / 3 : 0)
    }
    
    var eyeHeartView: some View {
        ZStack {
            Image(systemName: "heart.fill")
                .font(.system(size: screenWidth / 5, weight: .heavy))
                .foregroundColor(.regularPink)
                .scaleEffect(selectedRating == .excellent ? 1 : 0)
        }
    }
}

struct EyeView_Previews: PreviewProvider {
    static var previews: some View {
        EyeView(side: .left, selectedRating: .none, lineWidth: 15)
    }
}
