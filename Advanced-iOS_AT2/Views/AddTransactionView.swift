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
    @Binding var isSheetShowing : Bool
    
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
                    
                    AddCategoryView(categories: $viewModel.userCategories, selectedCategory: $viewModel.selectedCategory)
                    
                    /*
                    Button {
                        
                    } label: {
                        Text("Add new category")
                    } */

                }
                
                Section {
                    if(viewModel.loading) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                            .padding()
                    }
                    else {
                        Button("Save Transaction") {
                            
                            if let newTransaction = viewModel.AddTransaction(uid: authViewModel.currentUser?.id ?? "") {
                                
                                transactions.append(newTransaction)
                                
                                transactions = transactions.sorted {$0.date > $1.date}
                                
                                isSheetShowing = false
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
        }
        .onAppear {
            Task {
                await viewModel.fetchUserCategories(uid: authViewModel.currentUser?.id ?? "")
            }
            
        }
        /*.alert("Success!", isPresented: $viewModel.success) {
            Button("Ok", role: .cancel) {
                isSheetShowing = false
            }
        } */
        .alert("Please complete all fields.", isPresented: $viewModel.inputError) {
            Button("Understood", role: .cancel) {
                viewModel.inputError = false
            }
        }
    }
}

#Preview {
    AddTransactionView(transactions: .constant(Transaction.Mock_Transactions), isSheetShowing: .constant(false))
        .environmentObject(AuthViewModel())
}
