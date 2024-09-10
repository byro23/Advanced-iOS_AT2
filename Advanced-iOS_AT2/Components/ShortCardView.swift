//
//  ShortCardView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 7/9/2024.
//

import SwiftUI

struct ShortCardView: View {
    
    let fillColor: Color
    let title: String
    let value: String
    let imageName: String
    
    var body: some View {
        HStack(spacing: 16) {
            
            // Icon
            Image(systemName: imageName)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundStyle(fillColor)
                .padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("$\(value)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxWidth: 200)
        .padding(10)
        .background(fillColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}

#Preview {
    ShortCardView(fillColor: Color.moneyBrightGreenColor, title: "Example", value: "50000", imageName: "wallet.pass.fill")
}
