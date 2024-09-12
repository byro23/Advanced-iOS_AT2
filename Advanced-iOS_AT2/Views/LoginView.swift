//
//  LoginView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import Foundation
import SwiftUI

struct LoginView : View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel = LoginViewModel()
    @Binding var isBackPressed: Bool
    
    var body: some View {
        VStack() {
            InputView(text: $viewModel.email, title: "Email", placeholder: "youremail@domain.com")
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
            InputView(text: $viewModel.password, title: "Password", placeholder: "******", isSecuredField: true)
            
            HStack {
                Button {
                    isBackPressed = false
                } label: {
                    Text("Back")
                }
                .padding(.horizontal)
                
                Button {
                    Task {
                        await authViewModel.signIn(email: viewModel.email, password: viewModel.password)
                        if(authViewModel.authenticationState == .authenticated) {
                            viewModel.email = ""
                            viewModel.password = ""
                            
                            await authViewModel.fetchTransactions()
                            
                            navigationController.path.append(NavigationController.AppScreen.tab)
                        }
                    }
                } label: {
                    Text("Sign in")
                }
                .padding(.horizontal)
                .disabled(!viewModel.formIsValid)
            }
        }
    }
}

#Preview {
    ZStack{
        Color(red: 240/255, green: 255/255, blue: 255/255)
            .ignoresSafeArea()
        LoginView(isBackPressed: .constant(false))
            .environmentObject(AuthViewModel())
            .environmentObject(NavigationController())
    }
    
    
}
