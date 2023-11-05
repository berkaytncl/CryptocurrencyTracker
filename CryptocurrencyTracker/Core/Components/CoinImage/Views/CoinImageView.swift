//
//  CoinImageView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 5.11.2023.
//

import SwiftUI

struct CoinImageView: View {
    
    @StateObject var viewModel: CoinImageViewModel
    
    init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: CoinImageViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundStyle(Color.theme.secondaryText)
            }
        }
    }
}

#Preview {
    CoinImageView(coin: Coin.example)
        .padding()
        .previewLayout(.sizeThatFits)
}
