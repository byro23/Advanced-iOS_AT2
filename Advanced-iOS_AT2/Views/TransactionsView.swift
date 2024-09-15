//
//  TransactionsView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import SwiftUI

// MARK: - TransactionsView
struct TransactionsView: View {
    // MARK: - Properties
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel: TransactionsViewModel = TransactionsViewModel()
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            
            Text("Your Transactions")
                .font(.title)
                .fontWeight(.semibold)
                .padding(.top)
                .padding(.horizontal)
            
            
            HStack {
                Text("Search:")
                    .font(.subheadline)
                    .padding(.trailing, 10)
                    .fontWeight(.semibold)
                
                TextField("name, amount, category or date", text: $viewModel.filterText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.subheadline)
                Button {
                    viewModel.showAddTransactionSheet = true
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
                .padding(.leading)
                .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
            }
            .padding()
            
            ScrollView {
                LazyVStack {
                    if(viewModel.transactions.isEmpty && !viewModel.isLoadingTransactions) {
                        Text("No transactions to show.")
                            .font(.headline)
                            .padding()
                        
                        Button {
                            viewModel.showAddTransactionSheet = true
                        } label: {
                            Text("Manually add transaction?")
                        }
                    }
                    else if viewModel.isLoadingTransactions {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .padding()
                    }
                    else {
                        TransactionCardView(transactions: $viewModel.filteredTransactions, isFetching: $viewModel.isLoadingTransactions)
                    }
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchTransactions(uid: authViewModel.currentUser?.id ?? "")
            }
        }
        .sheet(isPresented: $viewModel.showAddTransactionSheet, content: {
            AddTransactionView(transactions: $viewModel.transactions, isSheetShowing: $viewModel.showAddTransactionSheet)
        })
        .onChange(of: viewModel.transactions) {
            viewModel.applyFilter()
        }
        .onChange(of: viewModel.filterText) {
            viewModel.applyFilter()
        }
        
    }
}

#Preview {
    TransactionsView()
        .environmentObject(AuthViewModel())
}
