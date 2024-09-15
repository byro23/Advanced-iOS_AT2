//
//  GoalCardView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 6/9/2024.
//

import Foundation
import SwiftUI

// MARK: - GoalCardView (Idea that wasn't implemented)

struct GoalCardView: View {
    
    // MARK: - Properties
    @State var title: String
    @State var currentAmount: Decimal
    @State var goalAmount: Decimal
    @State var goalCompletionDate: Date
    
    
    // MARK: - Body
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.bottom, 4)
            
            
            HStack {
                Text("\(currentAmount) / \(goalAmount) AUD")
                
                Spacer()
                
                Text("\(goalAmount - currentAmount) AUD left")
                    .foregroundStyle(.green)
                    .font(.subheadline)
                    .padding(.leading)
            }
            
            Text("Goal will be completed on")
            Text(DateFormatterHelper.shared.string(from: goalCompletionDate))
            
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .shadow(radius: 5)
        .frame(width: UIScreen.main.bounds.width * 0.9)
    }
}

#Preview {
    GoalCardView(title: "Example", currentAmount: 450, goalAmount: 850, goalCompletionDate: Date())
}
