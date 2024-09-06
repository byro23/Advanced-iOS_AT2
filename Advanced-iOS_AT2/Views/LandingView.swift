//
//  LoginView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

extension Color {
    static let moneyGreenColor = Color(red: 55/255, green: 140/255, blue: 120/255)
}


struct LandingView: View {
    
    @StateObject var viewModel = LandingViewModel()
    @State var isTapped: Bool = false
    
    var body: some View {
        if(viewModel.isLoginButtonTapped == false) {
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
                .padding(.top, 200)
                .padding(.bottom)
                
                NavigationLink {
                    
                } label: {
                    HStack {
                        Text("Already a member?")
                        Text("Login")
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
    ZStack {
        Color(red: 240/255, green: 255/255, blue: 255/255)
            .ignoresSafeArea()
        LandingView()
    }
    
}
