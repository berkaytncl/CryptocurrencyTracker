//
//  CircleButtonView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 31.10.2023.
//

import SwiftUI

struct CircleButtonView: View {
    
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundStyle(Color.theme.accent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundStyle(Color.theme.background)
            )
            .shadow(
                color: Color.theme.accent.opacity(0.25),
                radius: 10)
            .padding()
    }
}

#Preview {
    CircleButtonView(iconName: "heart.fill")
        .padding()
        .previewLayout(.sizeThatFits)
}
