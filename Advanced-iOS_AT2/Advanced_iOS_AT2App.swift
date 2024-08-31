//
//  Advanced_iOS_AT2App.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 31/8/2024.
//

import SwiftUI



@main
struct Advanced_iOS_AT2App: App {
    
    @StateObject var navigationController = NavigationController()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
            }
        }
        .environmentObject(navigationController)
    }
}
