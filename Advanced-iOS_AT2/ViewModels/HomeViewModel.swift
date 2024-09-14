//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var name: String = "Unauthenticated"
    @Published var expenseTotal: Int = 0
    @Published var incomeTotal: Int = 0
    @Published var currentBalance: Int = 0
    @Published var isLoadingTransactions: Bool = true
    
    @Published var transactions: [Transaction] = [] /*{
            didSet {
                calculate()  // Recalculate totals only when transactions change
            }
        } */
    @Published var categories: [Category] = []
    
    func fetchData(uid: String) async {
        
        // This is mainly for preview
        if uid == "" {
            transactions = Transaction.Mock_Transactions // For preview/testing
            print("Unauthenticated - unable to fetch transactions.")
            isLoadingTransactions = false
            return
        }
        
        // Fetch transactions
        transactions = await FirebaseManager.shared.fetchTransactions(uid: uid)
        // Fetch categories
        categories = await FirebaseManager.shared.fetchCategories(uid: uid)
        
        calculate()
        
        // Turn off loading indicator
        isLoadingTransactions = false
        
    }
    
    func addTestTransaction(uid: String) {
        let testTransaction = Transaction(id: UUID().uuidString, name: "Test", type: TransactionType.expense, categoryId: "mock_cat_001", date: Date(), amount: CurrencyUtils.dollarsToCents(dollars: 9.99)) 
        
        do {
            try FirebaseManager.shared.addTransaction(transaction: testTransaction, uid: uid)
            transactions.append(testTransaction)
        }
        catch {
            
        }
    }
    
    func calculate() {
        var expenses = 0
        var income = 0
        
        for transaction in self.transactions {
            if(transaction.type == .expense) {
                expenses += transaction.amount
            }
            else {
                income += transaction.amount
            }
        }
        
        self.expenseTotal = expenses
        self.incomeTotal = income
        
        self.currentBalance = income - expenses
        
        
    }
    

}
