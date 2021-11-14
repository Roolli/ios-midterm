//
//  CurrencySelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CurrencySelector: View {
   @State var currencies: [Currency] = []
    @State private var multiSelection = Set<UUID>()
    @EnvironmentObject var coinService: CoinGeckoService
    var body: some View {
        NavigationView {
            List(currencies,selection: $multiSelection) {currency in
                
            }
        }.onAppear() {
            coinService.loadCurrencies(completion: {
                (currs) in
                self.currencies = currs
            })
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        CurrencySelector()
    }
}
