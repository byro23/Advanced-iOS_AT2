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
    @Published var emailAlreadyExists: Bool = false
    
    func signIn(email: String, password: String) async {
        do {
            authenticationState = .authenticating
            try await FirebaseManager.shared.authenticateUser(email: email, password: password)
            print("User authenticated.")
            await fetchUser()
            authenticationState = .authenticated
        }
        catch {
            authenticationState = .unauthenticated
            print("Failed to login user.")
        }
        
        
    }
    
    func signUp(email: String, password: String, name: String) async {
        authenticationState = .authenticating
        
        do {
            let success = try await FirebaseManager.shared.createUser(email: email, password: password, name: name)
            if(success) {
                print("Sign up successful")
                authenticationState = .authenticated
                return
            }
            emailAlreadyExists = true
            authenticationState = .unauthenticated
        }
        catch {
            print("Error signing up")
            print(error)
            authenticationState = .unauthenticated
        }
    }
    
    // Fetches authenticated user from Firestore Db
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        // Retrieve user from Db
        guard let snapshot = await FirebaseManager.shared.fetchUserById(uid: uid) else {
            print("Snapshot is nil")
            return
        }
        
        // Decode user
        do {
            self.currentUser = try snapshot.data(as: User.self)
        }
        catch {
            print("Error decoding user")
            print(error)
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.currentUser = nil
            authenticationState = .unauthenticated
        }
        catch {
            print("Error signing user out: \(error)")
        }
    }
    
    // As of now, mainly used to prefetch transactions when logging in for better UX
    func fetchTransactions() async {
        
        guard let id = currentUser?.id else {
            print("Error: unauthenticated user.")
            return
        }
        
        let transactions = await FirebaseManager.shared.fetchTransactions(uid: id)
        
        currentUser?.transactions = transactions
    }
    
    
}
