//
//  CoinLogoView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 7.11.2023.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack {
            CoinImageView(coin: coin)
                .frame(width: 50, height: 50)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            Text(coin.name)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    Group {
        CoinLogoView(coin: Coin.example)
            .previewLayout(.sizeThatFits)
        CoinLogoView(coin: Coin.example)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
