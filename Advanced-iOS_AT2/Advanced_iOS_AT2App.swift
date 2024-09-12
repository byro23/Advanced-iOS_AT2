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
        
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationController.path) {
                LandingView()
                    .applyMintBackground()
                    .navigationDestination(for: NavigationController.AppScreen.self) { screen in
                        switch screen {
                        case .login:
                            LoginView(isBackPressed: .constant(false))
                                .applyMintBackground()
                        case .register:
                            RegistrationView()
                                .applyMintBackground()
                        case .tab:
                            UserView()
                                .applyMintBackground()
                                .navigationBarBackButtonHidden(true)
                        case .transactions:
                            TransactionsView()
                                .applyMintBackground()
                        }
                    }
                
            }
            .environmentObject(navigationController) // Pass navigatrion controller to child views
            .environmentObject(authViewModel) // Pass authentication view model to child views
        }
    }
}
