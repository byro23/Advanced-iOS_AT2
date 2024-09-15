//
//  CategoriesViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 14/9/2024.
//

import Foundation

// MARK: - CategoriesViewModel Class
@MainActor
class CategoriesViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var filterText: String = ""
    @Published var categories: [Category] = []
    @Published var isLoading: Bool = false
    
    // MARK: - Functions
    func FetchCategories(uid: String) async {
        
        isLoading = true
        
        if uid == "" {
            categories = Category.Default_Categories
            isLoading = false
            return
        }
        
        do {
            categories = try await FirebaseManager.shared.fetchDocuments(uid: uid, collectionName: "categories", as: Category.self)
            categories.sort {$0.name < $1.name}
            isLoading = false
        }
        catch {
            print("Error fetching categories: \(error)")
            isLoading = false
        }
       
    }
    
    func removeCategory(uid: String, at offsets: IndexSet) async {
        for index in offsets {
            let category = categories[index]
            // Delete from Firestore
            do {
                try await FirebaseManager.shared.deleteDocument(uid: uid, collectionName: "categories", documentId: category.name)
                print("Category deleted successfully.")
            }
            catch {
                print("Error deleting category: \(error.localizedDescription)")
            }
            
        }
        categories.remove(atOffsets: offsets)
    }
}
