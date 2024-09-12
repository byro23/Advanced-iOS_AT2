//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var name: String
    @Published var expenseTotal: Int
    @Published var incomeTotal: Int
    @Published var currentBalance: Int
    @Published var transactions : [Transaction] = []
    @Published var isLoadingTransactions: Bool = true
    
    init(name: String, expenseTotal: Int, incomeTotal: Int) {
        self.name = name
        self.expenseTotal = expenseTotal
        self.incomeTotal = incomeTotal
        self.currentBalance = incomeTotal - expenseTotal
    }
    
    func fetchTransactions(uid: String) async {
        
        if uid == "" {
            transactions = Transaction.Mock_Transactions // For preview/testing
            print("Unauthenticated - unable to fetch transactions.")
            isLoadingTransactions = false
            return
        }
        
        transactions = await FirebaseManager.shared.fetchTransactions(uid: uid)
        isLoadingTransactions = false
        
    }
    
    func addTestTransaction() {
        let testTransaction = Transaction(id: UUID().uuidString, name: "Test", type: TransactionType.debit, categoryId: "mock_cat_001", date: Date(), amount: CurrencyUtils.dollarsToCents(dollars: 9.99))
        
        // FirebaseManager.shared.addTransaction(transaction: testTransaction, uid: uid)
        
        transactions.append(testTransaction)
    }
    

}
