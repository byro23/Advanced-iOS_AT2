//
//  Category.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

struct Category: Identifiable, Codable, Hashable, Equatable {
    let id: String
    var name: String
    //var rgb: [Double]
    
    // Color Defaults: Blue(0 122 255), Orange: (255 149 0),
}

extension Category {
    static var Default_Categories: [Category] =
    [
        .init(id: "default_cat_01", name: "Food"),
        .init(id: "default_cat_02", name: "Housing"),
        .init(id: "default_cat_03", name: "Entertainment")
    ]
}
