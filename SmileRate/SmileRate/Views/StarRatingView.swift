//
//  StarsView.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import SwiftUI

struct StarRatingView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @Binding var selectedRate: StarRating
    var starAmount: Int = 5
    
    var body: some View {
        HStack {
            ForEach(1..<starAmount + 1) { rateIndex in
                Image(systemName: "star.fill")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(
                        selectedRate.rawValue >= rateIndex ?
                            Color.regularYellow :
                            (colorScheme == .light ? Color.regularGrey.opacity(0.7) : Color.white)
                    )
                    .scaleEffect(selectedRate.rawValue >= rateIndex ? 1.4 : 1)
                    .shadow(
                        color: selectedRate == .none ?
                            .clear :
                            .regularYellow.opacity(0.15),
                        radius: 5, x: 0, y: 5
                    )
                    .onTapGesture { selectedRate.set(number: rateIndex) } }
                .frame(maxWidth: .infinity)
        }
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingView(selectedRate: .constant(.none))
    }
}
