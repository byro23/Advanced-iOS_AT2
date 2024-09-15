//
//  Protocols.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 15/9/2024.
//

import Foundation


protocol FormProtocol {
    var isValid: Bool {get}
    
    var email: String {get set}
    
    var password: String {get set}
}

protocol DocumentManagerProtocol {
    func addDocument<T: Encodable>(object: T, toCollection collection: String, forUser uid: String) throws
    
    func fetchDocuments<T: Decodable>(uid: String, collectionName: String, as type: T.Type) async throws -> [T]
    
    func deleteDocument(uid: String, collectionName: String, documentId: String) async throws
}

protocol AuthenticationProtocol {
    func signIn(email: String, password: String) async
    
    func signUp(email: String, password: String, name: String) async
    
    func fetchUser() async
    
    @MainActor func signOut()
}
