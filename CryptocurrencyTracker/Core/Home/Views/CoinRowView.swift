//
//  CoinRowView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 1.11.2023.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
        .font(.subheadline)
    }
}

#Preview {
    CoinRowView(coin: Coin.example, showHoldingsColumn: true)
        .previewLayout(.sizeThatFits)
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: 0) {
            Text("\(coin.marketCapRank ?? 0)")
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
                .frame(minWidth: 30)
            CoinImageView(coin: coin)
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingValue.asCurrencyWith2Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text((coin.currentHoldings ?? 0).asNumberString())
                .foregroundStyle(Color.theme.accent)
        }
    }
    
    private var rightColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentPrice.asCurrencyWith6Decimals())
                .bold()
                .foregroundStyle(Color.theme.accent)
            Text(coin.priceChangePercentage24h?.asPercentString() ?? "")
                .foregroundStyle(
                    (coin.priceChange24h ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
