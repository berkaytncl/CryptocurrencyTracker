//
//  InfoView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 20.11.2023.
//

import SwiftUI

struct InfoView: View {
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com/nicksarno")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/berkaytncl/")!
    let githubURL = URL(string: "https://github.com/berkaytncl")!
    
    var body: some View {
        NavigationStack {
            List {
                developerCredits
                swiftfulThinkingCredits
                coinGeckoCredits
                applicationLinks
            }
            .font(.headline)
            .tint(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    XMarkButton()
                }
            }
        }
    }
}

#Preview {
    InfoView()
}

extension InfoView {
    private var swiftfulThinkingCredits: some View {
        Section {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This App was made by following a @SwiftfulThinking course on YouTube. It uses MVVM Architecture, Combine, and CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Subscribe on Youtube", destination: youtubeURL)
            Link("Buy Nick a cup of coffee ☕️", destination: coffeeURL)

        } header: {
            Text("Swiftful Thinking")
        }
    }
    
    private var coinGeckoCredits: some View {
        Section {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Visit CoinGecko 🦎", destination: coingeckoURL)
        } header: {
            Text("CoinGecko")
        }
    }
    
    private var developerCredits: some View {
        Section {
            VStack(alignment: .leading) {
                Text("This app was developed by Berkay Tuncel. It uses Swift and SwiftUI, and benefits from multi-threading, publishers & subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.theme.accent)
            }
            .padding(.vertical)
            Link("Linkedin", destination: linkedinURL)
            Link("Github", destination: githubURL)
        } header: {
            Text("Developer")
        }
    }
    
    private var applicationLinks: some View {
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Learn More", destination: defaultURL)
        } header: {
            Text("Application")
        }
    }
}
