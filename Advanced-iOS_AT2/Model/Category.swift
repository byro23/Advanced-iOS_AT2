//
//  Category.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

struct Category: Identifiable, Codable, Hashable {
    let id: String
    var name: String
    var amount: Decimal // Storing in decimal, converted to string when sent to db.
    //var rgb: [Double]
    
    // Color Defaults: Blue(0 122 255), Orange: (255 149 0),
}

extension Category {
    static var Mock_Categories: [Category] =
    [
        .init(id: UUID().uuidString, name: "Food", amount: 114.85),
        .init(id: UUID().uuidString, name: "Housing", amount: 250),
        .init(id: UUID().uuidString, name: "Entertainment", amount: 75)
    ]
}
