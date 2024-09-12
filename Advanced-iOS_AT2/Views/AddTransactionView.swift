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
    @State var transactionCategory: [Category]
    
    var body: some View {
        List {
            Section(header: Text("Transaction Details")) {
                TextField("Transaction Name", text: $transactionName)
                TextField("Transaction Amount", text: $transactionAmount)
                    .keyboardType(.decimalPad)
                    .onChange(of: transactionAmount) { oldValue, newValue in
                        if let amount = Double(newValue), amount < 0 {
                            transactionAmount = "" // Clear the field if the input is invalid
                        }
                    }
                
            }
            
            Section(header: Text("Tranaction Category")) {
                
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
    AddTransactionView(transactionCategory: Category.Default_Categories)
}
