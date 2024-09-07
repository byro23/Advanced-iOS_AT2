//
//  CardView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

struct WideCardView: View {
    
    let cardTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(cardTitle)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.black)
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "arrow.up.right")
                        .resizable()
                        .frame(width: 17, height: 17)
                        .foregroundColor(.cyan)
                }
            }
            .padding(.horizontal)
            //.padding(.trailing, 15)
            .padding(.top, 15)
        }
        .background(.white)
        .cornerRadius(15)
        .padding()
        .shadow(color: Color.black.opacity(0.1), radius: 15, x:5, y: 5)
    }
}

#Preview {
    WideCardView(cardTitle: "Example")
}
