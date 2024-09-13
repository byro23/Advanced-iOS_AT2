//
//  AddTransactionView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 12/9/2024.
//

import SwiftUI

struct AddTransactionView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = AddTransactionViewModel()
    
    @Binding var transactions: [Transaction]
    
    var body: some View {
        
        VStack {
            List {
                Section(header: Text("Transaction Details")) {
                    TextField("Transaction Name", text: $viewModel.transactionName)
                    TextField("Transaction Amount ($)", text: $viewModel.transactionAmount)
                        .keyboardType(.decimalPad)
                        .onChange(of: viewModel.transactionAmount) { oldValue, newValue in
                            if let amount = Double(newValue), amount < 0 {
                                viewModel.transactionAmount = "" // Clear the field if the input is invalid
                            }
                        }
                    
                }
                
                Section {
                    DatePicker("Select date", selection: $viewModel.selectedDate, in: ...Date(), displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(.automatic)
                } header: {
                    Text("Transaction Date")
                }
                
                Section {
                    Picker("Select type", selection: $viewModel.selectedType) {
                        ForEach(viewModel.transactionTypes, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                } header: {
                    Text("Transaction Type")
                }
                
                Section(header: Text("Transaction Category")) {
                    Picker("Select category", selection: $viewModel.selectedCategory) {
                        ForEach(viewModel.userCategories, id: \.self) { category in
                            Text(category.name).tag(category)
                        }
                    }
                    .pickerStyle(.automatic)
                    
                    Button {
                        
                    } label: {
                        Text("Add new category")
                    }

                }
                
                Section {
                    Button("Save Transaction") {
                        if let newTransaction = viewModel.AddTransaction(uid: authViewModel.currentUser?.id ?? "") {
                            
                            transactions.append(newTransaction)
                            
                            transactions = transactions.sorted {$0.date > $1.date}
                        }
                    }
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchUserCategories(uid: authViewModel.currentUser?.id ?? "")
            }
            
        }
    }
}

#Preview {
    AddTransactionView(transactions: .constant(Transaction.Mock_Transactions))
        .environmentObject(AuthViewModel())
}
