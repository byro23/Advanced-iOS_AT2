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
        HStack(spacing: 12) {
            
            // Icon
            Image(systemName: imageName)
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(fillColor)
                .padding(8)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                
                Text("$\(value)")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .frame(maxWidth: 160)
        .padding(8)
        .background(fillColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 4)
    }
}

#Preview {
    ShortCardView(fillColor: Color.moneyBrightGreenColor, title: "Example", value: "50000", imageName: "wallet.pass.fill")
}
