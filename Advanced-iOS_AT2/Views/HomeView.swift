//
//  HomeView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 2/9/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, user!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    //.foregroundColor(.primary)
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                    .padding(.horizontal)
                
                Image(systemName: "bell")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.blue)
                
            }
            .padding()
            
            HStack {
                Text("Your summary:")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                
            }
            .padding()
            
            HStack {
                PieChartView(data: Category.Mock_Categories)
            }
            
            Spacer()
            
        }
    }
}

#Preview {
    HomeView()
}
