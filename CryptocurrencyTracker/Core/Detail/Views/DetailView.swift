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
    
    @Namespace var overviewID
    @State private var scrollTarget: Namespace.ID? = nil
    
    @StateObject private var viewModel: DetailViewModel
    @State private var showFullDescription: Bool = false
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    ChartView(coin: viewModel.coin)
                        .padding(.vertical)
                    VStack(spacing: 20) {
                        overviewTitle
                            .id(overviewID)
                        Divider()
                        descriptionSection
                        overviewGrid
                        
                        additionalTitle
                        Divider()
                        additionalGrid
                        websiteSection
                    }
                    .padding()
                }
                .onChange(of: scrollTarget) { _, newValue in
                    guard let target = newValue else { return }
                    withAnimation {
                        proxy.scrollTo(target, anchor: .top)
                    }
                }
            }
            .navigationTitle(viewModel.coin.name)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    navigationBarTrailingItems
                }
            }
        .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(coin: Coin.example)
    }
}

extension DetailView {
    private var navigationBarTrailingItems: some View {
        HStack {
            Text(viewModel.coin.symbol.uppercased())
                .font(.headline)
                .foregroundStyle(Color.theme.secondaryText)
            CoinImageView(coin: viewModel.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundStyle(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = viewModel.coinDescription, !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundStyle(Color.theme.secondaryText)
                    
                    Button(showFullDescription ? "Show less" : "Read more..") {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                            
                            if showFullDescription {
                                scrollTarget = overviewID
                            } else {
                                scrollTarget = nil
                            }
                        }
                    }
                    .tint(.blue)
                    .font(.caption)
                    .bold()
                    .padding(.vertical, 4)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private var websiteSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let websiteString = viewModel.websiteURL,
               let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
            
            if let redditString = viewModel.redditURL,
               let url = URL(string: redditString) {
                Link("Reddit", destination: url)
            }
        }
        .tint(.blue)
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            content: {
                ForEach(viewModel.overviewStatistics) { stat in
                    StatisticView(stat: stat)
                }
            })
    }
    
    private var additionalGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .leading,
            spacing: spacing,
            content: {
                ForEach(viewModel.additionalStatistics) { stat in
                    StatisticView(stat: stat)
                }
            })
    }
}
