//
//  AuthViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 3/9/2024.
//

import Foundation

protocol Form {
    func formIsValid(email: String, password: String) -> Bool
}

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
}
