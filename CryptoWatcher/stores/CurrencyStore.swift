//
//  CurrencyStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CurrencyStore: ObservableObject {
    @Published var currencies: [Currency] = []
    
    func addCurrency(curr:Currency)
    {
        currencies.append(curr)
    }
    func getCurrency(index: Int) -> Currency
    {
        if(currencies.count > index)
        {
            return currencies[index]
        }
        else { return Currency(name:"") }
    }
}
