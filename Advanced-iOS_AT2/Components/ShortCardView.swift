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
                .frame(width: 40, height: 40)
                .foregroundStyle(fillColor)
                .padding(10)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundStyle(.white)
                
                Text("$\(value)")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
            }
        }
        .padding()
        .background(fillColor)
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .shadow(radius: 5)
    }
}

#Preview {
    ShortCardView(fillColor: Color.green, title: "Example", value: "$500", imageName: "wallet.pass.fill")
}
