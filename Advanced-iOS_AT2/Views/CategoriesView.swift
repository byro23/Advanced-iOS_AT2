//
//  CategoryView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 14/9/2024.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = CategoriesViewModel()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("Search:")
                    .padding(.trailing, 10)
                    .fontWeight(.semibold)
                
                TextField("Filter by category name", text: $viewModel.filterText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.subheadline)
            }
            .padding()
            
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
        }
        .navigationTitle("Categories")
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
