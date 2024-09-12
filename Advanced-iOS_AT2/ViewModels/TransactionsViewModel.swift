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
    
    init() {
        
        $filterText
                .receive(on: RunLoop.main) // Ensuring we're on the main thread
                .map { filter in
                    guard !filter.isEmpty else { return self.transactions }
                    return self.transactions.filter { transaction in
                        self.isMatch(transaction, searchText: filter)
                    }
                }
                .assign(to: &$filteredTransactions)
    }
    
    private func isMatch(_ transaction: Transaction, searchText: String) -> Bool {
        let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" // Specifying the specific format for date input filtering
        
        // Filter transactions by name, value, or date
        let searchTextLowercased = searchText.lowercased()
        return transaction.name.lowercased().contains(searchTextLowercased) ||
               "\(transaction.amount)".contains(searchTextLowercased) ||
                dateFormatter.string(from: transaction.date).contains(searchTextLowercased)
    }
    
    func fetchTransactions(uid: String) async {
        transactions = await FirebaseManager.shared.fetchTransactions(uid: uid)
        isLoadingTransactions = false
    }
    
}
