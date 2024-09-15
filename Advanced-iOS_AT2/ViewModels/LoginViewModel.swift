//
//  LoginViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import Foundation

class LoginViewModel: ObservableObject, FormProtocol {
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isInvalid: Bool = false
    
    var isValid: Bool {
        return email.contains("@") && password.count > 5
    }
}
