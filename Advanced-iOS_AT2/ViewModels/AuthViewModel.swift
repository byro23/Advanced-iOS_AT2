//
//  AuthViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 3/9/2024.
//

import Foundation
import Firebase
import FirebaseAuth

protocol Form {
    func formIsValid(email: String, password: String) -> Bool
}

enum AuthenticationState {
    case unauthenticated
    case authenticating
    case authenticated
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var currentUser: User?
    @Published var authenticationState: AuthenticationState = .unauthenticated
    
    func signIn(email: String, password: String) async {
        do {
            authenticationState = .authenticating
            try await FirebaseManager.shared.authenticateUser(email: email, password: password)
            print("User authenticated.")
            await fetchUser()
        }
        catch {
            authenticationState = .unauthenticated
            print("Failed to login user.")
        }
        
        
    }
    
    func signUp(email: String, password: String, name: String) async {
        authenticationState = .authenticating
        
        do {
            
        }
    }
    
    // Fetches authenticated user from Firestore Db
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        guard let snapshot = await FirebaseManager.shared.fetchUserById(uid: uid) else {
            print("Snapshot is nil")
            return
        }
        
        do {
            self.currentUser = try snapshot.data(as: User.self)
        }
        catch {
            print("Error decoding user")
            print(error)
        }
        
        
    }
}
