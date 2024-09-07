//
//  TabView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import SwiftUI

struct UserView: View {
    
    @EnvironmentObject var navigationController: NavigationController
    
    var body: some View {
        
        TabView(selection: $navigationController.currentTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
        }
        
    }
}

#Preview {
    UserView()
        .environmentObject(NavigationController())
}
