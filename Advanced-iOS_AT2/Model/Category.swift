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
    var totalAmount: Decimal // Storing in decimal, converted to string when sent to db.
    //var rgb: [Double]
    
    // Color Defaults: Blue(0 122 255), Orange: (255 149 0),
}

extension Category {
    static var Mock_Categories: [Category] =
    [
        .init(id: "mock_cat_001", name: "Food", totalAmount: 114.85),
        .init(id: "mock_cat_002", name: "Housing", totalAmount: 250),
        .init(id: "mock_cat_003", name: "Entertainment", totalAmount: 75)
    ]
}
