//
//  Color.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 31.10.2023.
//

import SwiftUI

extension Color {
    static let theme = ColorTheme()
}

struct ColorTheme {
    let accent = Color("AccentColor")
    let background = Color("BackgroundColor")
    let green = Color("IncGreenColor")
    let red = Color("DecRedColor")
    let secondaryText = Color("SecondaryTextColor")
}
