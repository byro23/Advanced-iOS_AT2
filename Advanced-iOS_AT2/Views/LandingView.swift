//
//  LoginView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

struct LandingView: View {
    
    let moneyGreenColor = Color(red: 55/255, green: 140/255, blue: 120/255)
    
    var body: some View {
        VStack {
            HStack() {
                Text("BudgetBuddy")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Image("money-bill-coin")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .aspectRatio(contentMode: .fit)
            }
            
            Button {
                
            } label: {
                 Text("Continue with email")
                    .fontWeight(.semibold)
                    .frame(width: UIScreen.main.bounds.width * 0.65, height: 40)
            }
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [moneyGreenColor, Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
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
        .padding(.top, 150)
        
        Spacer()
    }
}

#Preview {
    
    LandingView()
}
