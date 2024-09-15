//
//  Category.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

struct Category: Identifiable, Codable, Hashable, Equatable {
    var name: String
    var totalAmount: Int = 0
    //var rgb: [Double]
    
    var id: String { name } // Set name as the id
    
    // Color Defaults: Blue(0 122 255), Orange: (255 149 0),
}

extension Category {
    static var Default_Categories: [Category] =
    [
        .init(name: "Food"),
        .init(name: "Housing"),
        .init(name: "Entertainment")
    ]
}
