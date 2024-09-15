//
//  Utils.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import Foundation
import SwiftUI

// As it is more suitable for Firestore, numeric values are stored as cents (ints) on the database
// This utility allows for more seamless and error-free conversion from cents to dollars
struct CurrencyUtils {
    static func centsToDollars(cents: Int) -> Decimal {
        return Decimal(cents) / 100
    }
    
    static func dollarsToCents(dollars: Decimal) -> Int {
        return NSDecimalNumber(decimal: dollars * 100).intValue
    }
}

// Used to format dates in the format "d MMMM, yyyy"
struct DateFormatterHelper {
    
    static let shared: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d MMMM, yyyy"
        return formatter
    }()
}

// Customisation of app-wide background colour
struct MintBackgroundModifier: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Color.mintBackgroundColor
                .ignoresSafeArea()
            content
        }
    }
}

// Used to easily apply app-wide background colour to each view
extension View {
    func applyMintBackground() -> some View {
        self.modifier(MintBackgroundModifier())
    }
}

// Custom Colour Storage
extension Color {
    static let moneyBrightGreenColor = Color(red: 5/255, green: 168/255, blue: 107/255)
    static let moneyGreenColor = Color(red: 55/255, green: 140/255, blue: 120/255)
    static let mintBackgroundColor: Color = Color(red: 240/255, green: 255/255, blue: 255/255)
}
