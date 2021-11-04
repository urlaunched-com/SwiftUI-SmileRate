//
//  ContentView.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import SwiftUI

struct SmileRateView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State private var selectedRating: StarRating = .none
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var body: some View {
        VStack {
            Image(colorScheme == .light ? "logo_for_white_background" : "logo_for_black_background")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(30)
            Spacer()
            smileView
            Spacer()
            StarRatingView(selectedRate: $selectedRating)
                .animation(.spring(response: 0.25, dampingFraction: 0.4))
                .padding(30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    var smileView: some View {
        ZStack {
            SmileView(selectedRating: selectedRating, lineWidth: 10)
            VStack {
                Text("Rate the App")
                    .font(Font.custom("Tailwind", size: 44))
                Text("choose the star amount")
                    .font(Font.custom("Tailwind", size: 22))
            }
            .foregroundColor(Color.background)
            .opacity(selectedRating == .none ? 1 : 0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SmileRateView()
    }
}
