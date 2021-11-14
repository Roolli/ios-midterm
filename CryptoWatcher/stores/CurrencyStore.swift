//
//  CurrencyStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CurrencyStore: ObservableObject {
    @Published var currencies: [String] = []
}
