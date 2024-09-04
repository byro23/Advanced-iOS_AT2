//
//  LogoHeaderView.swift
//  Advanced-iOS_AT2
//
//  Created by Byron Lester on 4/9/2024.
//

import SwiftUI

struct LogoHeaderView: View {
    var body: some View {
        HStack() {
            Text("Budget")
                .font(.largeTitle)
                .fontWeight(.semibold)
            Image("money-bill-coin")
                .resizable()
                .frame(width: 30, height: 30)
                .aspectRatio(contentMode: .fit)
            Text("Buddy")
                .font(.largeTitle)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    LogoHeaderView()
}
