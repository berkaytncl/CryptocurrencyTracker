//
//  ChartView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 18.11.2023.
//

import SwiftUI

struct ChartView: View {
    
    private let data: [Double]
    private let maxY: Double
    private let minY: Double
    private let yAxis: Double
    private let lineColor: Color
    private let startingDate: Date
    private let endingDate: Date
    
    @State private var percentage: CGFloat = 0
    @State private var shadowsVisible = false
    
    init(coin: Coin) {
        data = coin.sparklineIn7d?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        yAxis = maxY - minY
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange >= 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startingDate = endingDate.addingTimeInterval(-7 * 24 * 60 * 60)
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartYAxis.padding(.horizontal, 4),alignment: .leading)
            
            chartDateLabels
                .padding(.horizontal, 4)
        }
        .font(.caption)
        .foregroundStyle(Color.theme.secondaryText)
        .onAppear {
            withAnimation(.easeIn(duration: 1.5)) {
                percentage = 1.0
            }
            withAnimation(.easeOut(duration: 1.5)) {
                shadowsVisible = true
            }
        }
    }
}

#Preview {
    ChartView(coin: Coin.example)
}

extension ChartView {
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    let yPosition = (1 - (data[index] - minY) / yAxis) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor.opacity(shadowsVisible ? 1 : 0), radius: 10, x: 0.0, y: 10)
            .shadow(color: lineColor.opacity(shadowsVisible ? 0.5 : 0), radius: 10, x: 0.0, y: 20)
            .shadow(color: lineColor.opacity(shadowsVisible ? 0.2 : 0), radius: 10, x: 0.0, y: 30)
            .shadow(color: lineColor.opacity(shadowsVisible ? 0.1 : 0), radius: 10, x: 0.0, y: 40)
        }
    }
    
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    private var chartYAxis: some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            Text(((minY + maxY) / 2).formattedWithAbbreviations())
            Spacer()
            Text(minY.formattedWithAbbreviations())
        }
        .bold()
    }
    
    private var chartDateLabels: some View {
        HStack {
            Text(startingDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
        .bold()
    }
}
