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
    @Published var selectedCategory: Category = Category(name: "")
    @Published var selectedType: TransactionType = .expense
    @Published var selectedDate: Date = Date()
    
    @Published var loading: Bool = false
    @Published var success: Bool = false
    @Published var inputError: Bool = false
    
    @Published var isAddCategorySheetShowing: Bool = false
    @Published var showConfirmation: Bool = false
    
    
    @Published var userCategories: [Category] = []
    
    let transactionTypes: [TransactionType] = [.expense, .income]
    
    func fetchUserCategories(uid: String) async {
        // Preview case (prevents fetch)
        if uid == "" {
            userCategories = Category.Default_Categories
            selectedCategory = userCategories[0]
            return
        }
        
        // Fetch user categories
        do {
            userCategories = try await FirebaseManager.shared.fetchDocuments(uid: uid, collectionName: "categories", as: Category.self)
            selectedCategory = userCategories[0]
        }
        catch {
            print("Error fetching categories: \(error.localizedDescription)")
        }
        
    }
    
    func AddTransaction(uid: String) -> Transaction? {
        
        loading = true
        
        if transactionName.isEmpty || transactionAmount.isEmpty {
            inputError = true
        }
        
        guard let parsedTransactionAmount = Decimal(string: transactionAmount) else {
            print("Transaction amount cannot be parsed as decimal.")
            loading = false
            return nil
        }
        
        let newTransaction = Transaction(id: UUID().uuidString, name: transactionName, type: selectedType, categoryId: selectedCategory.id, date: selectedDate, amount: CurrencyUtils.dollarsToCents(dollars: parsedTransactionAmount))
        
        if(uid == "") {
            loading = false
            success = true
            return newTransaction
            
        }
        
        do {
            try FirebaseManager.shared.addDocument(object: newTransaction, toCollection: "transactions", forUser: uid)
            loading = false
            success = true
            return newTransaction
        }
        catch {
            print("Error adding transaction: \(error.localizedDescription)")
            loading = false
            return nil
        }
        
        
        
    }
    
}
