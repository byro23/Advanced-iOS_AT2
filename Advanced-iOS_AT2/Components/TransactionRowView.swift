//
//  TransactionRowView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 11/9/2024.
//

import SwiftUI

struct TransactionRowView: View {
    
    var transactionModel: Transaction
    
    var transactionDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter
    }
    
    var body: some View {
        HStack(spacing: 5) {
            VStack(alignment: .leading, spacing: 4) {
                Text(transactionModel.name)
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                Text(transactionDateFormatter.string(from: transactionModel.date))
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            if(transactionModel.type == TransactionType.credit) {
                Text("+ $\(CurrencyUtils.centsToDollars(cents: transactionModel.amount))")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.moneyBrightGreenColor)
            }
            else {
                Text("- $\(CurrencyUtils.centsToDollars(cents: transactionModel.amount))")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
            }
            
            
        }
        .padding(12)
    }
}

#Preview {
    TransactionRowView(transactionModel: Transaction.Mock_Transactions[0])
}
