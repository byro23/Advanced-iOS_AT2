//
//  ContentView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 31/8/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello, user!")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(.blue)
                
            }
            .padding()
            
            Spacer()
            
        }
    }
}

#Preview {
    HomeView()
}
