//
//  LoginView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

// MARK: - LandingView
struct LandingView: View {
    // MARK: - Properties
    @EnvironmentObject var navigationController: NavigationController
    @StateObject var viewModel = LandingViewModel()
    @State var isTapped: Bool = false
    
    
    // MARK: - Body
    var body: some View {
        if(viewModel.isLoginButtonTapped == false) {
            Spacer()
            VStack {
                LogoHeaderView()
                
                Button {
                    viewModel.isLoginButtonTapped = true
                } label: {
                     Text("Continue with email")
                        .fontWeight(.semibold)
                        .frame(width: UIScreen.main.bounds.width * 0.65, height: 40)
                }
                .foregroundStyle(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.moneyGreenColor, Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .cornerRadius(25)
                .padding(.top, 250)
                .padding(.bottom)
                
                Button {
                    navigationController.path.append(NavigationController.AppScreen.register)
                } label: {
                    HStack {
                        Text("Haven't got an account?")
                            .foregroundStyle(.gray)
                        Text("Signup")
                            .fontWeight(.bold)
                            .foregroundStyle(.blue)
                    }
                }
                
            }
            .padding()
            
            Spacer()
        }
        else {
            VStack{
                LogoHeaderView()
                LoginView(isBackPressed: $viewModel.isLoginButtonTapped)
                    .padding(.top, 54)
            }
            
        }
       
    }
}

#Preview {
    LandingView()
}
