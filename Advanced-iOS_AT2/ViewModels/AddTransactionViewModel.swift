//
//  AddTransactionViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 13/9/2024.
//

import Foundation

@MainActor
class AddTransactionViewModel: ObservableObject {
    
    @Published var transactionName: String = ""
    @Published var transactionAmount: String = ""
    @Published var selectedCategory: Category = Category(id: "", name: "", totalAmount: 0)
    @Published var userCategories: [Category] = []
    
    let transactionTypes = ["Expense", "Income"]
    
    func fetchUserCategories(uid: String) async {
        
        // Preview case (prevents fetch)
        if uid == "" {
            userCategories = Category.Default_Categories
            selectedCategory = userCategories[0]
            return
        }
        
        userCategories = await FirebaseManager.shared.fetchCategories(uid: uid)
        
        selectedCategory = userCategories[0]
    }
    
    func AddTransaction(uid: String) {
        
        // Preview case
        if uid == "" {
            
        }
    }
    
}
