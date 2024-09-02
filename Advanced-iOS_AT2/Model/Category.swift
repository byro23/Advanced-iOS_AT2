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
}

extension Category {
    static var Mock_Categories: [Category] =
    [
        .init(name: "Groceries")
    ]
}
