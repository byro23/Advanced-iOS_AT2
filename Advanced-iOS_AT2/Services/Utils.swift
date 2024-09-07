//
//  Utils.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import Foundation
import SwiftUI

struct CurrencyUtils {
    static func centsToDollars(cents: Int) -> Decimal {
        return Decimal(cents) / 100
    }
    
    static func dollarsToCents(dollars: Decimal) -> Int {
        return NSDecimalNumber(decimal: dollars * 100).intValue
    }
}

struct DateFormatterHelper {
    
    static let shared: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        return formatter
    }()
}

struct MintBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.mintBackgroundColor
                .ignoresSafeArea()
            content
        }
    }
}

extension View {
    func applyMintBackground() -> some View {
        self.modifier(MintBackgroundModifier())
    }
}

// Custom Colour Storage

extension Color {
    static let moneyGreenColor = Color(red: 55/255, green: 140/255, blue: 120/255)
    static let mintBackgroundColor: Color = Color(red: 240/255, green: 255/255, blue: 255/255)
}
