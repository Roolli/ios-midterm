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
}
