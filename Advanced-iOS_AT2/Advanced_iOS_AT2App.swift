//
//  Advanced_iOS_AT2App.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 31/8/2024.
//

import SwiftUI
import FirebaseCore

// Firebase configuration
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct Advanced_iOS_AT2App: App {
    
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var navigationController = NavigationController()
    @StateObject var authViewModel = AuthViewModel()
    
    let backgroundColor: Color = Color(red: 240/255, green: 255/255, blue: 255/255)
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ZStack {
                    backgroundColor
                        .ignoresSafeArea()
                    HomeView()
                }
                
            }
        }
        .environmentObject(navigationController)
        .environmentObject(authViewModel)
    }
}
