//
//  CategoryView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 14/9/2024.
//

import SwiftUI
// MARK: - CategoriesView
struct CategoriesView: View {
    
    // MARK: - Properties
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = CategoriesViewModel()
    
    // MARK: - Body
    var body: some View {
        
        VStack {
            
            Text("Budgeting Categories")
                .font(.title)
                .fontWeight(.semibold)
                .padding()
            
            AddCategoryView(categories: $viewModel.categories, selectedCategory: .constant(Category.Default_Categories[0]))
                .padding(.horizontal)
            
            if(viewModel.isLoading) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(1.5)
                    .padding()
            }
            else if(viewModel.categories.isEmpty) {
                Text("No categories to show. Please add a new category")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
            }
            
            List {
                ForEach(viewModel.categories) { category in
                    Text(category.name)
                }
                .onDelete { offsets in
                    
                    Task {
                        await viewModel.removeCategory(uid: authViewModel.currentUser?.id ?? "", at: offsets)
                    }
                    
                }
            }
            .scrollContentBackground(.hidden)
        }
        .onAppear {
            
            Task {
                await viewModel.FetchCategories(uid: authViewModel.currentUser?.id ?? "")
            }
            
        }
        
        
        
    }
}

#Preview {
    CategoriesView()
        .environmentObject(AuthViewModel())
}
