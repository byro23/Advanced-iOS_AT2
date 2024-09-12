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
                Text("Search:")
                    .padding(.trailing, 10)
                    .fontWeight(.semibold)
                
                TextField("Filter by name, value or date", text: $viewModel.filterText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.subheadline)
                Button {
                
                } label: {
                     Text("+")
                        .fontWeight(.semibold)
                        .frame(width: 30, height: 30)
                        .fontWeight(.bold)
                        .font(.title)
                }
                .foregroundStyle(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.moneyGreenColor, Color.green]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .cornerRadius(15)
                .padding(.horizontal)
                .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
            }
            .padding()
            
            ScrollView {
                LazyVStack {
                    if(viewModel.transactions.isEmpty) {
                        Text("No transactions to show.")
                            .font(.headline)
                            .padding()
                        
                        Button {
                            
                        } label: {
                            Text("Manually add transaction?")
                        }
                    }
                    else {
                        ForEach(viewModel.filteredTransactions) { transaction in
                            TransactionRowView(transactionModel: transaction)
                        }
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

#Preview {
    TransactionsView()
        .environmentObject(AuthViewModel())
}
