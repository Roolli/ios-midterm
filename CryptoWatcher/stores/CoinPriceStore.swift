//
//  CoinPriceStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CoinPriceStore: ObservableObject {
    let service: CoinGeckoService
    
    init(service: CoinGeckoService)
    {
        self.service = service
    }
    
    @Published var coinPrices: Dictionary<String,Double> = [:]
    
    func getPriceForCurreny(currency:String) ->Double
    {
        if let val = self.coinPrices[currency] {
            return val
        }
        else { return -1}
    }
}
