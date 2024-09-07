//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = HomeViewModel(name: "Unauthorised", expenseTotal: 0, incomeTotal: 0)
    
    var body: some View {
        VStack {
            HStack {
                Text("Hello, \(authViewModel.currentUser?.name ?? "Unauthenticated")")
                    .font(.title2)
                    .fontWeight(.semibold)
                    //.foregroundColor(.primary)
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                
            }
            .padding()
            
            HStack {
                ShortCardView(fillColor: Color.green, title: "Income", value: "\(CurrencyUtils.centsToDollars(cents: viewModel.incomeTotal))", imageName: "arrowshape.down.circle.fill")
                ShortCardView(fillColor: Color.red, title: "Expense", value: "\(CurrencyUtils.centsToDollars(cents: viewModel.expenseTotal))", imageName: "arrowshape.up.circle.fill")
            }
            .padding()
            
            // Maybe expense/income here?
            
            HStack {
                Text("Your summary:")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                
            }
            .padding()
            
            HStack {
                PieChartView(data: Category.Mock_Categories)
            }
            
            HStack {
                Text("My goals: ")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding()
            
            Spacer()
            
        }
        .onAppear {
            viewModel.name = authViewModel.currentUser?.name ?? "Unauthenticated"
            viewModel.incomeTotal = authViewModel.currentUser?.income ?? 0
            viewModel.expenseTotal = authViewModel.currentUser?.expenses ?? 0
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
