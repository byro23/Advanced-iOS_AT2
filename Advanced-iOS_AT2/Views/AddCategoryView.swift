//
//  SwiftUIView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 14/9/2024.
//

import SwiftUI

struct AddCategoryView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    @StateObject var viewModel = AddCategoryViewModel()
    @Binding var categories: [Category]
    @Binding var selectedCategory: Category
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                TextField("Add new category", text: $viewModel.categoryName)
                    .background(Color.white)
                    .textFieldStyle(.roundedBorder)

                Button {
                    
                    let alreadyExists = viewModel.alreadyExists(forCategories: categories)
                    
                    if(!alreadyExists) {
                        let newCategory = viewModel.addCategory(uid: authViewModel.currentUser?.id ?? "")
                        
                        if let newCategory {
                            categories.append(newCategory)
                            categories.sort {$0.name < $1.name}
                            selectedCategory = newCategory
                        }
                    }
                } label: {
                    Text("Confirm")
                }
                .disabled(!viewModel.validCategory)
            }
            .padding(.top)
            //.padding(.horizontal)
            
            Text(viewModel.statusMessage)
                .font(.headline)
                .fontWeight(.semibold)
                .padding(.horizontal)
        }
        
        
    }
}

#Preview {
    AddCategoryView(categories: .constant(Category.Default_Categories), selectedCategory: .constant(Category.Default_Categories[0]))
}
