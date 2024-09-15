//
//  RegistrationView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import SwiftUI

// MARK: RegistrationView
struct RegistrationView: View {
    // MARK: - Properties
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel = RegistrationViewModel()
    
    // MARK: - Body
    var body: some View {
        VStack {
            
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
            else if(authViewModel.authenticationState == .unauthenticated) {
                Button {
                    Task {
                        await authViewModel.signUp(email: viewModel.email, password: viewModel.password, name: viewModel.name)
                    }
                    if(authViewModel.authenticationState == .authenticated) {
                        navigationController.path.append(NavigationController.AppScreen.tab)
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
                .disabled(!viewModel.isValid)
                .opacity(viewModel.isValid ? 1.0 : 0.5)
            }
            else {
                Text("Registration successful! Redirecting...")
                    .font(.headline)
            }
        }
        .alert("Email already exists. Please try again.", isPresented: $authViewModel.emailAlreadyExists) {
            Button("Ok", role: .cancel) {
                authViewModel.emailAlreadyExists = false
            }
        }
        .padding(.bottom, 100)
        .navigationTitle("Registration")
        .navigationBarTitleDisplayMode(.large)
        .onChange(of: authViewModel.authenticationState) { _, newState in
            if(newState == .authenticated) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    // Code to run after 3 seconds
                    navigationController.path.removeLast()
                    navigationController.path.append(NavigationController.AppScreen.tab)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        RegistrationView()
            .environmentObject(AuthViewModel())
            .environmentObject(NavigationController())
    }
    
}
