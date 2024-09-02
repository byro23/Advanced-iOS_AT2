//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    // While testing, going to use static values
    
    @Published var expenseTotal: Double
    @Published var incomeTotal: Double
    @Published var currentBalance: Double
    
    init(expenseTotal: Double, incomeTotal: Double) {
        self.expenseTotal = expenseTotal
        self.incomeTotal = incomeTotal
        self.currentBalance = incomeTotal - expenseTotal
    }
    

}
