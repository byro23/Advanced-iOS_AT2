//
//  CardView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

struct TransactionCardView: View {
    
    @Binding var transactions: [Transaction]
    @Binding var isFetching : Bool
    
    var body: some View {
        VStack {
            HStack {
                /*Text("Latest Transactions")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black) */
                
                
                
                LazyVStack(spacing: 1) {
                    if(isFetching) {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(1.5)
                    }
                    else {
                        if(transactions.isEmpty) {
                            Text("No transactions to show.")
                                .font(.headline)
                                .padding()
                        }
                        else {
                            // Showing the 7 most recent transactoins
                            ForEach(transactions.sorted {$0.date > $1.date}.prefix(6)) { transaction in
                                TransactionRowView(transactionModel: transaction)
                                Divider()
                            }
                        }
                    }
                }
                
                
                /*Button {
                    
                } label: {
                    Image(systemName: "arrow.up.right")
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.cyan)
                } */
            }
            //.padding(.horizontal)
            //.padding(.trailing, 15)
        }
        .background(.white)
        .cornerRadius(15)
        .padding(.horizontal)
        .shadow(color: Color.black.opacity(0.1), radius: 15, x:5, y: 5)
    }
}

#Preview {
    TransactionCardView(transactions: .constant(Transaction.Mock_Transactions), isFetching: .constant(false))
}
