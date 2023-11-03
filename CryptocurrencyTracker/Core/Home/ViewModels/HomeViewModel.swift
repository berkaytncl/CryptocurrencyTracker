//
//  HomeViewModel.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 3.11.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.allCoins.append(Coin.example)
            self.portfolioCoins.append(Coin.example)
        }
    }
    
    
}
