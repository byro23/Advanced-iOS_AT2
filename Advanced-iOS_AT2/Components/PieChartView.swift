//
//  PieChartView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Charts
import SwiftUI

struct PieChartView: View {
    var data: [(category: String, value: Double)] = [
        ("Category A", 30),
        ("Category B", 20),
        ("Category C", 50)
    ]
    
    var body: some View {
        Chart(data, id: \.category) { item in
            SectorMark(
                angle: .value("Value", item.value)
            )
            .foregroundStyle(by: .value("Category", item.category))
        }
    }
}

#Preview {
    PieChartView()
}
