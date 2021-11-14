//
//  CoinSelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CoinSelector: View {
    @EnvironmentObject  var coinStore: CoinStore
    var body: some View {
        NavigationView {
            List(coinStore.coins) {
                coin in HStack {
                    Text("\(coin.id)")
                    Text("\(coin.fullName)")
                    Text("\(coin.symbol)")
                }
            }
        }.navigationBarTitle(Text("Select a coin"))
    }
}

struct CoinSelector_Previews: PreviewProvider {
    static var previews: some View {
        CoinSelector()
    }
}
