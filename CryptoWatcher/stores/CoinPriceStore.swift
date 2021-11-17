//
//  CoinPriceStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CoinPriceStore: ObservableObject {
    let service: CoinGeckoService
    @Published var coinPrice: CoinPrices?
    
    init(service: CoinGeckoService)
    {
        self.service = service
    }
    
    
    func getPriceForCurreny(currency:String) ->Double
    {
        if let val = self.coinPrice?.prices[currency] {
            return val
        }
        else { return -1}
    }
    func getCoinPricesForCurrencies(coin:Coin,currencies:[Currency])
    {
        service.getCoinPricesInGivenCurrencies(coin:coin, currencies:currencies,completion: { res in
            self.coinPrice = res
        })
    }
}
