//
//  Category.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

struct Category: Identifiable, Codable, Hashable {
    var id = UUID().uuidString // Converting to string as it will likely be send to to database.
    var name: String
    var amount: Decimal // Storing in decimal, converted to string when sent to db.
}

extension Category {
    static var Mock_Categories: [Category] =
    [
        .init(name: "Groceries", amount: 114.85),
        .init(name: "Rent", amount: 250)
    ]
}
