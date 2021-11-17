//
//  CoinPriceLister.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 17..
//

import SwiftUI

struct CoinPriceLister: View {
    @EnvironmentObject var coinPriceStore: CoinPriceStore
    @EnvironmentObject var coinStore: CoinStore
    @EnvironmentObject var currencyStore:CurrencyStore
    let selectedCurrencies: Set<UUID>
    let selectedCoin: String
    var body: some View {
        ZStack{
            Text("One unit of "+(coinPriceStore.coinPrice?.coin  ?? "") + "is worth")
            List{
                ForEach((coinPriceStore.coinPrice?.prices.sorted(by: >))!, id:\.key) {
                    key,value in
                    Text("\(value) in \(key)")
                }
            }
            
        }.onAppear{
            let currencies = selectedCurrencies.map({uuid in
                return currencyStore.getCurrency(id: uuid)
                
            })
            coinPriceStore.getCoinPricesForCurrencies(coin: coinStore.getCoin(id: selectedCoin), currencies: currencies)
        }
    }
}

struct CoinPriceLister_Previews: PreviewProvider {
    static var previews: some View {
        CoinPriceLister(selectedCurrencies: Set<UUID>(),selectedCoin:"")
    }
}
