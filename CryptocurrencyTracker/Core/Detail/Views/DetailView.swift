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
    
    @StateObject var viewModel: DetailViewModel
    
    init(coin: Coin) {
        _viewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        Text("")
    }
}

#Preview {
    DetailView(coin: Coin.example)
}
