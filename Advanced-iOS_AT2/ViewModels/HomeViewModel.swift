//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

// MARK: - HomeViewModel Class
@MainActor
class HomeViewModel: ObservableObject {
    //MARK: - Properties
    @Published var name: String = "Unauthenticated"
    @Published var expenseTotal: Int = 0
    @Published var incomeTotal: Int = 0
    @Published var currentBalance: Int = 0
    @Published var isLoadingTransactions: Bool = true
    @Published var transactions: [Transaction] = []
    @Published var categories: [Category] = []
    
    //MARK: - Functions
    func fetchData(uid: String) async { // Used to user data
        
        // For preview only
        if uid == "" {
            transactions = Transaction.Mock_Transactions // For preview/testing
            print("Unauthenticated - unable to fetch transactions.")
            isLoadingTransactions = false
            return
        }
        
        // Fetch transactions
        do {
            transactions = try await FirebaseManager.shared.fetchDocuments(uid: uid, collectionName: "transactions", as: Transaction.self)
        }
        catch {
            print("Error fetching transactions: \(error.localizedDescription)")
        }
        
        // Fetch categories
        do {
            categories = try await FirebaseManager.shared.fetchDocuments(uid: uid, collectionName: "categories", as: Category.self)
        }
        catch {
            print("Error fetching categories: \(error.localizedDescription)")
        }
        
        // Calculate totals expenses, income and category totals
        calculate()
        
        // Turn off loading indicator
        isLoadingTransactions = false
        
    }
    
    // Calculate expenses, income, and total amounts for each category
    func calculate() {
        var expenses = 0
        var income = 0
        
        for transaction in self.transactions {
            if(transaction.type == .expense) {
                expenses += transaction.amount
                
                if let index = categories.firstIndex(where: { $0.id == transaction.categoryId}) {
                    categories[index].totalAmount += transaction.amount
                }
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
