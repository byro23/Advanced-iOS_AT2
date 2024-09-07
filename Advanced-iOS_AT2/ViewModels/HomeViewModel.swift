//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    
    @Published var name: String
    @Published var expenseTotal: Int
    @Published var incomeTotal: Int
    @Published var currentBalance: Int
    
    init(name: String, expenseTotal: Int, incomeTotal: Int) {
        self.name = name
        self.expenseTotal = expenseTotal
        self.incomeTotal = incomeTotal
        self.currentBalance = incomeTotal - expenseTotal
    }
    

}
