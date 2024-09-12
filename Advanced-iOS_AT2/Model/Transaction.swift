//
//  Transaction.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 10/9/2024.
//

import Foundation

struct Transaction: Identifiable, Codable {
    
    let id: String
    var name: String // E.g., Netflix
    var type: TransactionType
    var categoryId: String
    var date: Date
    var amount: Int // Stored in cents
    
}

enum TransactionType: String, Codable {
    case debit = "Debit"
    case credit = "Credit"
}

extension Transaction {
    
    static var Mock_Transactions: [Transaction] =
    [
        .init(id: UUID().uuidString, name: "Netflix", type: TransactionType.debit, categoryId: "mock_cat_001", date: Date(), amount: CurrencyUtils.dollarsToCents(dollars: 9.99)),
        .init(id: UUID().uuidString, name: "Youtube Premium", type: TransactionType.debit, categoryId: "mock_cat_002", date: Date(), amount: CurrencyUtils.dollarsToCents(dollars: 11.99))
        
    ]
}
