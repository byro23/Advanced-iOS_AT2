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
        HStack {
            Chart(data, id: \.id) { item in
                SectorMark(
                    angle: .value("Value", item.amount),
                    angularInset: 0.5
                )
                .foregroundStyle(by: .value("Category", item.name))
            }
            .frame(width: 200, height: 200)
        .chartLegend(.hidden)
            
            VStack {
                ForEach(data) { item in
                    HStack {
                        
                    }
                }
            }
        }
    }
}

#Preview {
    PieChartView(data: Category.Mock_Categories)
}
