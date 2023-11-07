//
//  XMarkButton.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 7.11.2023.
//

import SwiftUI

struct XMarkButton: View {
    
    @Environment(\.dismiss) var dismissScreen
    
    var body: some View {
        Button(action: {
            dismissScreen.callAsFunction()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
}

#Preview {
    XMarkButton()
}
