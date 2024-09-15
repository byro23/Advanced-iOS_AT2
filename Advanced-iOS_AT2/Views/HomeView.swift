//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

struct HomeView: View {
    
    //: MARK: - View model and environment objects
    @EnvironmentObject var navigationController: NavigationController
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = HomeViewModel()
    
    //: MARK: - View
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
                        Spacer()
                        Text("Account Balance")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    .padding(.top)
                    
                    HStack {
                        Spacer()
                        Text("$\(CurrencyUtils.centsToDollars(cents: viewModel.currentBalance))")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    
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
                        PieChartView(data: viewModel.categories)
                    }
                    .padding()
                    
                    HStack {
                        Text("Recent Transactions")
                            .font(.title2)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        
                        Button {
                            navigationController.currentTab = .transactions
                        } label: {
                            Text("See all")
                        }
                        .font(.footnote)
                        .buttonStyle(.bordered)
                        .buttonBorderShape(.capsule)
                        
                    }
                    .padding()
                    
                    TransactionCardView(transactions: $viewModel.transactions, isFetching: $viewModel.isLoadingTransactions)
                    
                    
                    Spacer()
                    
                }
                .onAppear {
                    viewModel.name = authViewModel.currentUser?.name ?? "Unauthenticated"
                    viewModel.incomeTotal = authViewModel.currentUser?.income ?? 0
                    viewModel.expenseTotal = authViewModel.currentUser?.expenses ?? 0
                    
                    Task {
                        // Fetch necessary data as view loads
                        await viewModel.fetchData(uid: authViewModel.currentUser?.id ?? "")
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
