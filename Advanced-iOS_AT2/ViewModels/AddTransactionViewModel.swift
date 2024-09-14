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
    @Published var selectedType: TransactionType = .expense
    @Published var selectedDate: Date = Date()
    
    @Published var loading: Bool = false
    @Published var success: Bool = false
    @Published var inputError: Bool = false
    
    
    @Published var userCategories: [Category] = []
    
    let transactionTypes: [TransactionType] = [.expense, .income]
    
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
            try FirebaseManager.shared.addTransaction(transaction: newTransaction, uid: uid)
            loading = false
            success = true
            return newTransaction
        }
        catch {
            loading = false
            return nil
        }
        
        
        
    }
    
}
