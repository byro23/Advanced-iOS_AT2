//
//  Firestore Manager.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 3/9/2024.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseFirestore

class FirebaseManager {
    static let shared = FirebaseManager()
    private let db = Firestore.firestore()
    
    
    // Database operations here
    
    func authenticateUser(email:String, password: String) async throws {
        try await Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    func createUser(email: String, password: String, name: String) async throws -> Bool {
        
        do {
            let emailQuerySnapshot = try await Firestore.firestore().collection("Users").whereField("email", isEqualTo: email).getDocuments()
            
            if(!emailQuerySnapshot.isEmpty) {
                print("Email already exists")
                return false
            }
            
            
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let user = User(id: authResult.user.uid, name: name, email: email, expenses: 0, income: 0)
            let encodedUser = try Firestore.Encoder().encode(user)
            
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            return true
        }
        
        catch {
            print("Failed to create user")
            return false
        }
        
    }
    
    func fetchUserById(uid: String) async -> DocumentSnapshot? {
        do {
            let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
            return snapshot
        }
        catch {
            print("Error retrieving snapshot")
            return nil
        }
    }
    
    func addTransaction(transaction: Transaction, uid: String) {
        let transactionsRef = db.collection("users").document(uid).collection("transactions")
        
        do {
            try transactionsRef.addDocument(from: transaction) { error in
                if let error = error {
                    print("Error adding transaction for \(uid) to Firestore: \(error.localizedDescription)")
                } else {
                    print("Transaction added successfully")
                }
            }
        } catch let error {
            print("Error adding transaction for \(uid) to Firestore: \(error.localizedDescription)")
        }
        
    }
    
    func fetchTransactions(uid: String) async -> [Transaction] {
        var transactions: [Transaction] = []
        
        let transactionsRef = db.collection("users").document(uid).collection("Transactions")
        do {
            let querySnapshot = try await transactionsRef.getDocuments()
            transactions = try querySnapshot.documents.map {try $0.data(as: Transaction.self)}
        }
        catch {
            print("Error fetching transactions: \(error)")
        }
        
        // Returns empty array if an error is thrown
        return transactions
    }
    
}
