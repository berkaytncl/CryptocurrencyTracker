//
//  CryptocurrencyTrackerApp.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 30.10.2023.
//

import SwiftUI

@main
struct CryptocurrencyTrackerApp: App {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .toolbar(.hidden)
            }
            .environmentObject(viewModel)
        }
    }
}
