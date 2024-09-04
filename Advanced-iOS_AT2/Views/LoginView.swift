//
//  LoginView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import Foundation
import SwiftUI

struct LoginView : View {
    @State var email: String = ""
    @State var password: String = ""
    @Binding var isBackPressed: Bool
    
    var body: some View {
        VStack() {
            InputView(text: $email, title: "Email", placeholder: "youremail@domain.com")
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            InputView(text: $password, title: "Password", placeholder: "******", isSecuredField: true)
            
            HStack {
                Button {
                    isBackPressed = false
                } label: {
                    Text("Back")
                }
                .padding(.horizontal)
                
                Button {
                    
                } label: {
                    Text("Sign in")
                }
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    ZStack{
        Color(red: 240/255, green: 255/255, blue: 255/255)
            .ignoresSafeArea()
        LoginView(isBackPressed: .constant(false))
    }
    
    
}
