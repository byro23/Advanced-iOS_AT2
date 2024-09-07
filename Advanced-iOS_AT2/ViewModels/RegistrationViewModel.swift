//
//  RegistrationViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import Foundation


class RegistrationViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var name = ""
    @Published var loadingMessage = "Loading home page"
    
    private var loadingMessageArray = ["Loading home page.", "Loading home page..", "Loading home page..."]
    
    var formIsValid: Bool {
        return !email.isEmpty && email.contains(".com") && email.contains("@") && !password.isEmpty && password.count > 5 && !name.isEmpty && confirmPassword == password
    }
    
    var validEmail: Bool {
        return email.contains(".com") && email.contains("@")
    }
}

