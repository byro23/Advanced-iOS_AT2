//
//  Goal.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

// MARK: - Goal Model (Idea that wasn't implemented)
struct Goal: Identifiable, Codable, Hashable {
        
    let id : String
    var name: String
    var goalAmount: Int
    var savedAmount: Int
    
}

extension Goal {
    static var mock_goals: [Goal] = [
        .init(id: UUID().uuidString, name: "Holiday", goalAmount: 450, savedAmount: 1200)
    ]
}
