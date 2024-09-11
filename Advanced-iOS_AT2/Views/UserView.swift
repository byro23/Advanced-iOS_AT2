//
//  TabView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import SwiftUI

struct UserView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationController: NavigationController
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.mintBackgroundColor)
    }
    
    var body: some View {
                    
        TabView(selection: $navigationController.currentTab) {
            HomeView(uid: authViewModel.currentUser?.id ?? "")
                .applyMintBackground()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(NavigationController.Tab.home)
                
        }
    }
}

#Preview {
    UserView()
        .environmentObject(NavigationController())
        .environmentObject(AuthViewModel())
}
