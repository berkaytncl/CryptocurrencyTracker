//
//  DetailViewModel.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 11.11.2023.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {

    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetails
            .sink { returnedCoinDetails in
                print(returnedCoinDetails ?? "")
            }
            .store(in: &cancellables)
    }
}
