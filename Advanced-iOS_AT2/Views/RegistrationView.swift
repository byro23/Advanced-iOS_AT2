//
//  RegistrationView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import SwiftUI

struct RegistrationView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            // Email field
            ZStack(alignment: .trailing) {
                InputView(text: $viewModel.email, title: "Email", placeholder: "youremail@domain.com")
                    .textInputAutocapitalization(.never)
                    .keyboardType(.emailAddress)
                
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
            
            ZStack(alignment: .trailing) {
                InputView(text: $viewModel.name, title: "Name", placeholder: "Your name")
                
                if(!viewModel.name.isEmpty) {
                    Image(systemName: "checkmark.circle.fill")
                        .imageScale(.large)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGreen))
                        .padding(.top, 28)
                        .padding(.trailing, 24)
                }
            }
            
            // Password field
            ZStack(alignment: .trailing) {
                InputView(text: $viewModel.password, title: "Password", placeholder: "Enter a password", isSecuredField: true)
                
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
            ZStack(alignment: .trailing) {
                InputView(text: $viewModel.confirmPassword, title: "Confirm Password", placeholder: "Re-enter your password", isSecuredField: true)
                
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
            
            if(authViewModel.authenticationState == .authenticating) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
            }
            else {
                Button {
                    Task {
                        await authViewModel.signUp(email: viewModel.email, password: viewModel.password, name: viewModel.name)
                    }
                    if(authViewModel.authenticationState == .authenticated) {
                        navigationController.path.append(NavigationController.AppScreen.)
                    }
                    
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
        }
        .padding(.bottom, 100)
        .navigationTitle("Registration")
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
            .environmentObject(AuthViewModel())
            .environmentObject(NavigationController())
    }
    
}
