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
    var totalAmount: Int // Stored as cents
    //var rgb: [Double]
    
    // Color Defaults: Blue(0 122 255), Orange: (255 149 0),
}

extension Category {
    static var Default_Categories: [Category] =
    [
        .init(id: "default_cat_01", name: "Food", totalAmount: 0),
        .init(id: "default_cat_02", name: "Housing",totalAmount: 0),
        .init(id: "default_cat_03", name: "Entertainment", totalAmount: 0)
    ]
}
