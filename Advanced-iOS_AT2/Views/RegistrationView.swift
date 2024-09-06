//
//  RegistrationView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            // Email field
            ZStack(alignment: .trailing) {
                InputView(text: $viewModel.email, title: "Email", placeholder: "youremail@domain.com")
                
                if(!viewModel.email.isEmpty) {
                    if(viewModel.validEmail) {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(.top, 28)
                            .padding(.trailing, 24)
                            
                    }
                    else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.top, 28)
                            .padding(.trailing, 24)
                    }
                }
            }
            
            // Password field
            ZStack(alignment: .trailing) {
                InputView(text: $viewModel.password, title: "Password", placeholder: "Enter a password")
                
                if(!viewModel.password.isEmpty) {
                    if(viewModel.password.count > 5) {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(.top, 28)
                            .padding(.trailing, 24)
                    }
                    else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.top, 28)
                            .padding(.trailing, 24)
                    }
                }
            }
            
            // Password confirmation field
            ZStack(alignment: .leading) {
                InputView(text: $viewModel.confirmPassword, title: "Confirm Password", placeholder: "Re-enter your password")
                
                if(!viewModel.confirmPassword.isEmpty) {
                    if(viewModel.password == viewModel.confirmPassword) {
                        Image(systemName: "checkmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGreen))
                            .padding(.top, 28)
                            .padding(.trailing, 24)
                    }
                    else {
                        Image(systemName: "xmark.circle.fill")
                            .imageScale(.large)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemRed))
                            .padding(.top, 28)
                            .padding(.trailing, 24)
                    }
                }
            }
            
            Button {
                
            } label: {
                Text("Sign up")
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width * 0.50, height: 40)
            }
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [Color.moneyGreenColor, Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
            .cornerRadius(25)
            .padding()
            .disabled(!viewModel.formIsValid)
            .opacity(viewModel.formIsValid ? 1.0 : 0.5)
            
        }
        .padding(.bottom, 100)
        .navigationTitle("Registration")
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
    }
    
}
