//
//  LoginViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import Foundation

class LoginViewModel: ObservableObject, Form {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
    func formIsValid(email: String, password: String) -> Bool {
        return email.contains("@") && password.count > 5
    }
}
