//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var name: String
    @Published var expenseTotal: Int
    @Published var incomeTotal: Int
    @Published var currentBalance: Int
    @Published var transactions : [Transaction] = []
    @Published var loadingTransactions: Bool = true
    
    init(name: String, expenseTotal: Int, incomeTotal: Int, uid: String) async {
        self.name = name
        self.expenseTotal = expenseTotal
        self.incomeTotal = incomeTotal
        self.currentBalance = incomeTotal - expenseTotal
    }
    
    func fetchTransactions(uid: String) async {
        
        do {
            transactions = await FirebaseManager.shared.fetchTransactions(uid: uid)
        }
        
    }
    
    func addTestTransaction() {
        let testTransaction = Transaction.Mock_Transactions[0]
        
        // FirebaseManager.shared.addTransaction(transaction: testTransaction, uid: uid)
        
        transactions.append(testTransaction)
    }
    

}
