//
//  HeaderView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 10/9/2024.
//

import SwiftUI

struct UserHeaderView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        HStack {
            SmallLogoView()
            
            Spacer()
            
            Menu {
                Button("Signout") {
                    authViewModel.signOut()
                    navigationController.path.removeLast()
                }
                .onTapGesture {
                    navigationController.currentTab = .home
                }
            } label: {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
            }
            
        }
        .padding(.top)
        .padding(.horizontal)
    }
}

struct SmallLogoView: View {
    var body: some View {
        HStack(spacing: 2) {
            Text("Budget")
                .font(.title2)
                .fontWeight(.semibold)
            Image("money-bill-coin")
                .resizable()
                .frame(width: 24, height: 24)
                .aspectRatio(contentMode: .fit)
            Text("Buddy")
                .font(.title2)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    UserHeaderView()
}
