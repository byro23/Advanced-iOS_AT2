//
//  TransactionsViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 12/9/2024.
//

import Foundation

@MainActor
class TransactionsViewModel: ObservableObject {
    
    @Published var transactions: [Transaction] = []
    @Published var filteredTransactions: [Transaction] = []
    @Published var filterText: String = ""
    @Published var isLoadingTransactions: Bool = true
    
    @Published var showAddTransactionSheet: Bool = false
    
    // Used to match the transactions with the filter text
    private func isMatch(_ transaction: Transaction, searchText: String) -> Bool {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" // Specifying the specific format for date input filtering
        
        // Filter transactions by name, value, or date
        let searchTextLowercased = searchText.lowercased()
        return transaction.name.lowercased().contains(searchTextLowercased) ||
               "\(transaction.amount)".contains(searchTextLowercased) ||
                dateFormatter.string(from: transaction.date).contains(searchTextLowercased) ||
                transaction.categoryId.lowercased().contains(searchTextLowercased)
    }
    
    func fetchTransactions(uid: String) async {
        // Preview case
        if uid == "" {
            transactions = Transaction.Mock_Transactions
            isLoadingTransactions = false
            return
        }
        // Fetch transactions
        do {
            transactions = try await FirebaseManager.shared.fetchDocuments(uid: uid, collectionName: "transactions", as: Transaction.self)
        }
        catch {
            print("Error fetching document: \(error.localizedDescription)")
        }
        
        // Turn off progress view
        isLoadingTransactions = false
    }
    
    func applyFilter() {
        if(filterText.isEmpty) {
            filteredTransactions = transactions
        }
        else {
            filteredTransactions = transactions.filter { transaction in
                isMatch(transaction, searchText: filterText)
            }
        }
    }
    
}
