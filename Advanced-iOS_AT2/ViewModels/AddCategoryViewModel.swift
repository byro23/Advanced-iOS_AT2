//
//  AddCategoryViewModel.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 14/9/2024.
//

import Foundation

class AddCategoryViewModel: ObservableObject {
    
    @Published var categoryName: String = ""
    @Published var statusMessage: String = ""
    var statusMessages: [String] = ["Category added successfully!", "Error adding new category. Please try again", "Category already exists."]
    
    var validCategory: Bool {
        return categoryName.count > 0
    }
    
    func alreadyExists(forCategories: [Category]) -> Bool {
        
        for category in forCategories {
            if(categoryName == category.name){
                categoryName = ""
                return true
            }
        }
        
        statusMessage = statusMessages[2]
        return false
    }
    
    func addCategory(uid: String) -> Category? {
        
        // Preview Case
        
        
        let newCategory = Category(name: categoryName)
        
        if uid == "" {
            statusMessage = statusMessages[0]
            return newCategory
        }
        
        do {
            try FirebaseManager.shared.addDocument(object: newCategory, toCollection: "categories", forUser: uid)
            categoryName = ""
            statusMessage = statusMessages[0]
            print("Category added successfully")
            return newCategory
            

        }
        catch {
            statusMessage = statusMessages[1]
            return nil
        }
        
        
        
        
        
        
    }
    
}
