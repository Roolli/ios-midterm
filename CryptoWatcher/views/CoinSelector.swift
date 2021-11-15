//
//  CoinSelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CoinSelector: View {
    @EnvironmentObject var coinStore: CoinStore
    var body: some View {
        NavigationView{
            
            List(coinStore.coins) { coin in
                VStack
                {
                 HStack{
                     NavigationLink(destination: CurrencySelector()){
                         Text("\(coin.fullName)").font(.body).fontWeight(.bold)
                     }.onTapGesture {
                         coinStore.setSelectedCoin(coin: coin)
                         print(coin.id)
                     }
                 }
                }
            }.navigationTitle("Select a coin")
        }
        
    }
}

struct CoinSelector_Previews: PreviewProvider {
    static var previews: some View {
        CoinSelector()
    }
}
