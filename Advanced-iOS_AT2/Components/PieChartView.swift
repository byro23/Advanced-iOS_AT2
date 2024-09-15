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
                        Text("\(CurrencyUtils.centsToDollars(cents: item.totalAmount))")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .foregroundStyle(by: .value("Category", item.name))
                }
                .frame(width: 200, height: 200)
                //.chartLegend(.hidden)
                
                /*VStack(alignment: .leading) {
                    ForEach(data) { item in
                        HStack(alignment: .center) {
                            Circle()
                                .fill(.blue)
                                .frame(width: 10, height: 10)
                            Text(item.name)
                                .font(.caption)
                        }
                    }
                }
                .padding(.leading) */
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
