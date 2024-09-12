//
//  AddTransactionView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 12/9/2024.
//

import SwiftUI

struct AddTransactionView: View {
    
    @State private var transactionName: String = ""
    @State private var transactionAmount: String = ""
    @State private var transactionCategory: String = ""
    
    var body: some View {
        List {
            Section(header: Text("Transaction Details")) {
                TextField("Transaction Name", text: $transactionName)
                TextField("Transaction Amount", text: $transactionAmount)
                    .keyboardType(.decimalPad)
                
            }
            
            Section(header: Text("Tranaction Category")) {
                TextField("Transaction Category", text: $transactionCategory)
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
}

#Preview {
    AddTransactionView()
}
