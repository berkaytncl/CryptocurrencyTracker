//
//  String.swift
//  CryptocurrencyTracker
//
//  Created by Berkay Tuncel on 19.11.2023.
//

import Foundation

extension String {
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression)
    }
}
