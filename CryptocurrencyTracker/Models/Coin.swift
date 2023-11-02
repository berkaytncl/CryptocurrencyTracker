//
//  Coin.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 31.10.2023.
//

import Foundation

struct Coin: Identifiable, Codable {
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCap: Double?
    let marketCapRank: Int?
    let fullyDilutedValuation: Double?
    let totalVolume, high24h, low24h: Double?
    let priceChange24h, priceChangePercentage24h, marketCapChange24h, marketCapChangePercentage24h: Double?
    let circulatingSupply, totalSupply, maxSupply, ath: Double?
    let athChangePercentage: Double?
    let athDate: String?
    let atl, atlChangePercentage: Double?
    let atlDate: String?
    let lastUpdated: String?
    let sparklineIn7d: SparklineIn7D?
    let priceChangePercentage24hInCurrency: Double?
    let currentHoldings: Double?
    
    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case fullyDilutedValuation = "fully_diluted_valuation"
        case totalVolume = "total_volume"
        case high24h = "high_24h"
        case low24h = "low_24h"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
        case marketCapChange24h = "market_cap_change_24h"
        case marketCapChangePercentage24h = "market_cap_change_percentage_24h"
        case circulatingSupply = "circulating_supply"
        case totalSupply = "total_supply"
        case maxSupply = "max_supply"
        case ath
        case athChangePercentage = "ath_change_percentage"
        case athDate = "ath_date"
        case atl
        case atlChangePercentage = "atl_change_percentage"
        case atlDate = "atl_date"
        case lastUpdated = "last_updated"
        case sparklineIn7d = "sparkline_in_7d"
        case priceChangePercentage24hInCurrency = "price_change_percentage_24h_in_currency"
        case currentHoldings
    }
    
    func updateHoldings(amount: Double) -> Coin {
        Coin(id: id, symbol: symbol, name: name, image: image, currentPrice: currentPrice, marketCap: marketCap, marketCapRank: marketCapRank, fullyDilutedValuation: fullyDilutedValuation, totalVolume: totalVolume, high24h: high24h, low24h: low24h, priceChange24h: priceChange24h, priceChangePercentage24h: priceChangePercentage24h, marketCapChange24h: marketCapChange24h, marketCapChangePercentage24h: marketCapChangePercentage24h, circulatingSupply: circulatingSupply, totalSupply: totalSupply, maxSupply: maxSupply, ath: ath, athChangePercentage: athChangePercentage, athDate: athDate, atl: atl, atlChangePercentage: atlChangePercentage, atlDate: atlDate, lastUpdated: lastUpdated, sparklineIn7d: sparklineIn7d, priceChangePercentage24hInCurrency: priceChangePercentage24hInCurrency, currentHoldings: amount)
    }
    
    var currentHoldingValue: Double {
        return (currentHoldings ?? 0) * currentPrice
    }
    
    static let example = Coin(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400", currentPrice: 34405, marketCap: 671490536833, marketCapRank: 1, fullyDilutedValuation: 722028472818, totalVolume: 12443983894, high24h: 34703, low24h: 34175, priceChange24h: -8.604145657169283, priceChangePercentage24h: -0.025, marketCapChange24h: -1687436049.548462, marketCapChangePercentage24h: -0.25067, circulatingSupply: 19530118.0, totalSupply: 21000000.0, maxSupply: 21000000.0, ath: 69045, athChangePercentage: -50.19621, athDate: "2021-11-10T14:24:11.849Z", atl: 67.81, atlChangePercentage: 50611.42983, atlDate: "2013-07-06T00:00:00.000Z", lastUpdated: "2023-11-01T10:43:15.990Z", sparklineIn7d: SparklineIn7D(price: [34020.427380281406,34125.840776602345,33832.05989098268,33920.34877602841,34119.33095423452,34223.46629282618,34184.31955450562,34306.24590645088,34500.39950445031,34794.064294617725,34977.14917229203,34566.84669192482,34585.649270686525,34669.810155632666,34695.25689112283,34678.581491268335,34554.45704005894,34579.238189685086,34498.18414928194,34560.07735883247,34700.21210209115,34762.25600105437,34799.81951265261,34689.55138581278,34539.26331513439,34585.51754083313,34669.20048243959,34558.157533936625,34443.088552374844,34262.28229370022,34065.44522512412,34263.92160001575,34211.8998198967,34176.74777625217,34033.104374738556,33770.84081549448,33914.59488361607,33968.614846032244,34022.61393169833,34155.79511547591,34117.28146334639,34249.251206485445,34174.451552912586,33982.06706691499,33811.24275719445,34094.37861521169,34141.98316939835,34134.54785209992,34088.8952849728,34214.93736870389,33950.22191771048,34115.97198871094,34149.99902697573,34095.366687660164,34025.831912125635,34092.23886225304,34157.590829847795,33882.49540765278,33963.86892309777,33905.64181616615,33610.02693718559,33615.544337132786,33669.51273974943,33782.09349945729,33840.39395402028,33816.06934849948,33899.09305644032,33900.58995062194,33904.51103450244,34082.93895259495,34082.11023386474,34093.50647683378,34107.42141094718,34063.848628556356,34056.35890307521,34080.478619453665,34101.02661613586,34089.8772386167,34183.782924578,34012.7407062676,34083.1249839345,34095.33287935734,34227.92376720186,34130.04283424462,34112.7550582817,34188.02286594119,34119.260363113375,34116.98041021088,34191.840975173545,34113.21446355799,34092.630932838576,34103.79359791367,34019.65936489062,34024.53766456724,33982.87227589427,34045.17602616784,34038.11381558912,34097.16788062668,34121.14231865369,34206.19848900798,34233.01180162739,34173.10489880809,34257.95961954397,34427.65594720777,34364.76468778788,34485.57847885062,34484.88635340286,34388.72686859644,34763.44622176207,34682.50275640219,34579.070129764485,34585.67685212119,34547.02262109948,34726.40365909276,34524.94714831651,34472.36182412488,34456.921474785435,34329.808885024795,34278.82029141593,34327.88124500856,34256.023190104854,34315.34063718538,34220.29127788138,34406.7454219915,34553.88603974555,34553.54954359292,34651.31384110436,34608.92381680724,34679.85957555487,34617.9038740627,34663.13992743165,34481.282690290995,34336.068119159136,34333.534500933856,34428.53024175343,34452.59927187314,34580.77123469633,34491.04715056969,34494.37986890222,34527.496353933864,34462.72614000576,34397.19430042551,34220.87837655487,34248.88133600439,34300.07522213647,34244.988540354476,34163.155409460735,34408.880298482785,34446.74011601751,34448.03724542942,34518.485187201186,34314.89989526099,34174.573423241025,34347.24118843922,34263.92304531344,34441.587044179745,34389.27729541464,34429.10789269401,34467.42498008609,34640.077352659755,34491.95654544809,34600.234530905356,34672.2892841885,34516.49879191784,34508.71665702418,34466.55986096471,34451.56056131886,34461.717660541966]), priceChangePercentage24hInCurrency: -0.025001869143508954, currentHoldings: 3)
}

struct SparklineIn7D: Codable {
    let price: [Double]?
}
