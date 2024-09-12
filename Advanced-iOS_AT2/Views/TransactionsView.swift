//
//  TransactionsView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import SwiftUI

// Add, remove, edit transactions and the categories they belong to

struct TransactionsView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel: TransactionsViewModel = TransactionsViewModel()
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Search")
                    .padding(.trailing, 10)
                TextField("Filter by name, value or date", text: $viewModel.filterText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            
            ScrollView {
                LazyVStack {
                    if(viewModel.transactions.isEmpty) {
                        Text("No transactions to show.")
                            .font(.headline)
                            .padding()
                    }
                    else {
                        
                    }
                }
            }
        }
        .navigationTitle("Transactions")
        .onAppear {
            Task {
                viewModel.fetchTransactions
            }
        }
    }
}
