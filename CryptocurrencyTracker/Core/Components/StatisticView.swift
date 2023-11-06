//
//  StatisticView.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 6.11.2023.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: Statistic
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption)
                .foregroundStyle(Color.theme.secondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundStyle(Color.theme.accent)
            
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                    .bold()
            }
            .foregroundStyle((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

#Preview {
    Group {
        StatisticView(stat: Statistic.stat1)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        StatisticView(stat: Statistic.stat2)
            .previewLayout(.sizeThatFits)
        StatisticView(stat: Statistic.stat3)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
