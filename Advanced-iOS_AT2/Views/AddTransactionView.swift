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
    
    var body: some View {
        
        VStack {
            List {
                Section(header: Text("Transaction Details")) {
                    TextField("Transaction Name", text: $viewModel.transactionName)
                    TextField("Transaction Amount", text: $viewModel.transactionAmount)
                        .keyboardType(.decimalPad)
                        .onChange(of: viewModel.transactionAmount) { oldValue, newValue in
                            if let amount = Double(newValue), amount < 0 {
                                viewModel.transactionAmount = "" // Clear the field if the input is invalid
                            }
                        }
                    
                }
                
                Section(header: Text("Tranaction Category")) {
                    Picker("Select Category", selection: $viewModel.selectedCategory) {
                        ForEach(viewModel.userCategories, id: \.self) { category in
                            Text(category.name).tag(category)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section {
                    Button("Save Transaction") {
                        // Add transaction logic here
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
    AddTransactionView()
        .environmentObject(AuthViewModel())
}
