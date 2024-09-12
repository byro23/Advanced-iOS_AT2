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
            
            UserHeaderView()
            
            ScrollView {
                VStack {
                    
                    HStack {
                        Text("Hello, \(authViewModel.currentUser?.name ?? "Unauthenticated")")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        ShortCardView(fillColor: Color.moneyBrightGreenColor, title: "Income", value: "\(CurrencyUtils.centsToDollars(cents: viewModel.incomeTotal))", imageName: "arrowshape.down.circle.fill")
                        ShortCardView(fillColor: Color.red, title: "Expenses", value: "\(CurrencyUtils.centsToDollars(cents: viewModel.expenseTotal))", imageName: "arrowshape.up.circle.fill")
                    }
                    .padding(.top)
                    
                    // Maybe expense/income here?
                    
                    HStack {
                        Text("Your summary")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.horizontal)
                        Spacer()
                        
                    }
                    .padding(.top)
                    
                    HStack {
                        PieChartView(data: Category.Mock_Categories)
                    }
                    .padding()
                    
                    HStack {
                        Text("Recent Transactions")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Button {
                            viewModel.addTestTransaction()
                        } label: {
                            Text("Add test")
                                .font(.footnote)
                        }
                        
                        Button {
                            
                        } label: {
                            Text("See all")
                        }
                        .font(.footnote)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        
                    }
                    .padding()
                    
                    TransactionCardView(transactions: $viewModel.transactions, isFetching: $viewModel.loadingTransactions)
                    
                    HStack {
                        Text("My goals")
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
                    
                    Task {
                        await viewModel.fetchTransactions(uid: authViewModel.currentUser?.id ?? "")
                    }
                }
                
            }
        }
        
        
        
        
    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
        .applyMintBackground()
}
