//
//  User.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 3/9/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var name: String
    var email: String
    var expenses: Int // Stored as cents
    var income: Int // Stored as cents
    
    var transactions: [Transaction]
    
}

extension User {
    static var Mock_User = User(id: UUID().uuidString, name: "Geoff", email: "test@gmail.com", expenses: CurrencyUtils.dollarsToCents(dollars: 250), income: CurrencyUtils.dollarsToCents(dollars: 500), transactions: Transaction.Mock_Transactions)
}
