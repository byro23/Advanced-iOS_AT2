//
//  TabView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import SwiftUI

// MARK: - Userview
struct UserView: View {
    // MARK: - Properties
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var navigationController: NavigationController
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color.mintBackgroundColor)
    }
    
    
    // MARK: - Body
    var body: some View {
                    
        TabView(selection: $navigationController.currentTab) {
            HomeView()
                .applyMintBackground()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(NavigationController.Tab.home)
            
            TransactionsView()
                .applyMintBackground()
                .tabItem {
                    Label {
                        Text("Transactions")
                    } icon: {
                        if(navigationController.currentTab == .transactions) {
                            Image("handshake-blue")
                        }
                        else {
                            Image("handshake-grey")
                        }
                        
                    }
                }
                .tag(NavigationController.Tab.transactions)
            
            CategoriesView()
                .applyMintBackground()
                .tabItem {
                    Label("Categories", systemImage: "folder.fill.badge.person.crop")
                }
                .tag(NavigationController.Tab.categories)
            
        }
    }
}

#Preview {
    UserView()
        .environmentObject(NavigationController())
        .environmentObject(AuthViewModel())
}
