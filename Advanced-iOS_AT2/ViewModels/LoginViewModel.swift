//
//  LoginViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import Foundation

class LoginViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isInvalid: Bool = false
    
    var formIsValid: Bool {
        return email.contains("@") && password.count > 5
    }
}
