//
//  CurrencySelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CurrencySelector: View {
    @State private var multiSelection = Set<UUID>()
    @EnvironmentObject var currencyStore: CurrencyStore
    @EnvironmentObject var coinService: CoinGeckoService
    var body: some View {
        NavigationView {
            //TODO: set to small size don't know how atm...
            Text("Select the currencies you want to check the token's price in")
            List(selection: $multiSelection) {
                ForEach(currencyStore.currencies,id:\.id)
                {currency in
                    Text("\(currency.name)")
                }
            }.onAppear() {
                coinService.loadCurrencies(completion: {
                    (currsStr) in
                    currsStr.forEach {val in
                        currencyStore.addCurrency(curr:Currency(name: val))
                    }
                    
                })
            }
        }
        .toolbar{
            EditButton()
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector()
    }
}
