//
//  PieChartView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Charts
import SwiftUI

struct PieChartView: View {
    var data: [Category]
    
    var body: some View {
        
        if(data.count != 0) {
            HStack {
                Chart(data, id: \.id) { item in
                    SectorMark(
                        angle: .value("Value", 1),
                        angularInset: 0.5
                    )
                    .annotation(position: .overlay) {
                        Text("$\(CurrencyUtils.centsToDollars(cents: item.totalAmount))")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .foregroundStyle(by: .value("Category", item.name))
                }
                .frame(width: 250, height: 250)
            }
        }
        else {
            Text("No data to show.")
        }
    }
}

#Preview {
    PieChartView(data: Category.Default_Categories)
}
