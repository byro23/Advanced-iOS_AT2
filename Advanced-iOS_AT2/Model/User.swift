//
//  User.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 3/9/2024.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    var name: String
    var email: String
    
}

extension User {
    static var Mock_User = User(id: UUID().uuidString, name: "Geoff", email: "test@gmail.com")
}
