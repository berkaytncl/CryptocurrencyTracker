//
//  UIApplication.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 6.11.2023.
//

import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
