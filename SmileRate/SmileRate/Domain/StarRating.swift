//
//  StarRate.swift
//  SmileRate
//
//  Created by Alexander Sharko on 29.09.2021.
//

import Foundation
import SwiftUI

enum StarRating {
    case none, awful, bad, average, good, excellent
    
    mutating func set(number: Int) {
        switch number {
        case 1:
            self = .awful
        case 2:
            self = .bad
        case 3:
            self = .average
        case 4:
            self = .good
        case 5:
            self = .excellent
        default:
            self = .none
        }
    }
    
    var rawValue: Int {
        switch self {
        case .awful:
            return 1
        case .bad:
            return 2
        case .average:
            return 3
        case .good:
            return 4
        case .excellent:
            return 5
        case .none:
            return 0
        }
    }
    
    var smileAmount: CGFloat {
        switch self {
        case .awful:
            return -30
        case .bad:
            return -15
        case .average:
            return 0
        case .good:
            return 15
        case .excellent:
            return 30
        case .none:
            return 0
        }
    }
    
    var cheekColor: Color {
        switch self {
        case .none:
            return Color.clear
        case .awful:
            return Color.clear
        case .bad:
            return Color.white.opacity(0.3)
        case .average:
            return Color.white.opacity(0.3)
        case .good:
            return Color.white.opacity(0.3)
        case .excellent:
            return Color.regularPink.opacity(0.5)
        }
    }
    
    var faceColor: Color {
        switch self {
        case .none:
            return Color.regularYellow
        case .awful:
            return Color.regularRed
        case .bad:
            return Color.regularYellow
        case .average:
            return Color.regularYellow
        case .good:
            return Color.regularYellow
        case .excellent:
            return Color.regularYellow
        }
    }
}
