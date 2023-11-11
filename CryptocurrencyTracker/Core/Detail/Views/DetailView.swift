//
//  DetailView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 10.11.2023.
//

import SwiftUI

struct DetailLoadingView: View {
   
    @Binding var coin: Coin?
    
    var body: some View {
        ZStack {
            if let coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
    }
    
    var body: some View {
        Text(coin.name)
    }
}

#Preview {
    DetailView(coin: Coin.example)
}
