//
//  CurrencyStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CurrencyStore: ObservableObject {
    @Published var currencies: [Currency] = []
    var allCurrencies: [Currency] = []
    var popularCurrencies = [Currency(name:"huf"),Currency(name:"gbp"),Currency(name:"eur"),Currency(name:"btc"),Currency(name:"eth"),Currency(name:"usd"),Currency(name:"tet")]
    func addCurrency(curr:Currency)
    {
        allCurrencies.append(curr)
    }
    func getCurrency(id:UUID) -> Currency
    {
        if let result =  currencies.first(where: {c in c.id == id})
        {
            return result
        }
        else {
            return Currency(name:"")
        }
    }
    func showPopularCurrencySelection(state:Bool)
    {
        if state {
            currencies = popularCurrencies
        }
        else {
            currencies = allCurrencies
        }
    }
}
