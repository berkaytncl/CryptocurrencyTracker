//
//  DetailViewModel.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 11.11.2023.
//

import Foundation
import Combine

final class DetailViewModel: ObservableObject {

    @Published var overviewStatistics: [Statistic] = []
    @Published var additionalStatistics: [Statistic] = []
    @Published var coin: Coin
    @Published var coinDescription: String? = nil
    @Published var websiteURL: String? = nil
    @Published var redditURL: String? = nil
    
    private let coinDetailDataService: CoinDetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.coinDetailDataService = CoinDetailDataService(coin: coin)
        addSubscribers()
    }
    
    private func addSubscribers() {
        coinDetailDataService.$coinDetails
            .combineLatest($coin)
            .map(mapDataToStatistics)
            .sink { [weak self] returnedArrays in
                self?.overviewStatistics = returnedArrays.overview
                self?.additionalStatistics = returnedArrays.additional
            }
            .store(in: &cancellables)
        
        coinDetailDataService.$coinDetails
            .sink { [weak self] returnedCoinDetails in
                self?.coinDescription = returnedCoinDetails?.readableDescription
                self?.websiteURL = returnedCoinDetails?.links?.homepage?.first
                self?.redditURL = returnedCoinDetails?.links?.subredditURL
            }
            .store(in: &cancellables)
    }
    
    private func mapDataToStatistics(coinDetail: CoinDetail?, coin: Coin) -> (overview: [Statistic], additional: [Statistic]) {
        let overviewArray: [Statistic] = createOverviewArray(coin: coin)
        let additionalArray: [Statistic] = createAdditionalArray(coinDetail: coinDetail, coin: coin)
        return (overviewArray, additionalArray)
    }
    
    private func createOverviewArray(coin: Coin) -> [Statistic] {
        let price = coin.currentPrice.asCurrencyWith6Decimals()
        let priceChangePercentage = coin.priceChangePercentage24h
        let priceStat = Statistic(title: "Current Prive", value: price, percentageChange: priceChangePercentage)
        
        let marketCap = "$" + (coin.marketCap?.formattedWithAbbreviations() ?? "")
        let marketCapChangePercentage = coin.marketCapChangePercentage24h
        let marketCapStat = Statistic(title: "Market Capitalization", value: marketCap, percentageChange: marketCapChangePercentage)
        
        let rank = "\(coin.marketCapRank ?? 0)"
        let rankStat = Statistic(title: "Rank", value: rank)
        
        let volume = "$" + (coin.totalVolume?.formattedWithAbbreviations() ?? "")
        let volumeStat = Statistic(title: "Volume", value: volume)
        
        return [priceStat, marketCapStat, rankStat, volumeStat]
    }
    
    private func createAdditionalArray(coinDetail: CoinDetail?, coin: Coin) -> [Statistic] {
        let high = coin.high24h?.asCurrencyWith6Decimals() ?? "n/a"
        let highStat = Statistic(title: "24h High", value: high)
        
        let low = coin.low24h?.asCurrencyWith6Decimals() ?? "n/a"
        let lowStat = Statistic(title: "24h Low", value: low)
        
        let priceChange = coin.priceChange24h?.asCurrencyWith6Decimals() ?? "n/a"
        let priceChangePercentage = coin.priceChangePercentage24h
        let priceChangeStat = Statistic(title: "24h Price Change", value: priceChange, percentageChange: priceChangePercentage)
        
        let marketCapChange = "$" + (coin.marketCapChange24h?.formattedWithAbbreviations() ?? "")
        let marketCapChangePercentage = coin.marketCapChangePercentage24h
        let marketCapChangeStat = Statistic(title: "24h Market Cap Change", value: marketCapChange, percentageChange: marketCapChangePercentage)
        
        let blockTime = coinDetail?.blockTimeInMinutes ?? 0
        let blockTimeString = blockTime == 0 ? "n/a" : "\(blockTime)"
        let blockStat = Statistic(title: "Block Time", value: blockTimeString)
        
        let hashing = coinDetail?.hashingAlgorithm ?? "n/a"
        let hashingStat = Statistic(title: "Hashing Algorithm", value: hashing)
        
        return [highStat, lowStat, priceChangeStat, marketCapChangeStat, blockStat, hashingStat]
    }
}
