//
//  Statistic.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 6.11.2023.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID().uuidString
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
    
    static let stat1 = Statistic(title: "Market Cap", value: "$12.5Bn", percentageChange: 25.34)
    static let stat2 = Statistic(title: "Total Volume", value: "$1.23Tr")
    static let stat3 = Statistic(title: "Portfolio Value", value: "$50.4k", percentageChange: -12.34)
}
