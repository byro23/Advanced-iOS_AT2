//
//  Goal.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation


struct Goal: Identifiable, Codable, Hashable {
        
    var id = UUID().uuidString
    var name: String
    var description: String
    var goalAmount: Decimal // Converted to string when sent to db.
    var savedAmount: Decimal // Converted to string when sent to db.
    
}
