//
//  CoinStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CoinStore: ObservableObject {
    @Published var coins:[Coin] = [Coin(id:"bitcoin",symbol:"btc",fullName:"Bitcoin"),Coin(id: "tether", symbol: "usdt", fullName: "Tether"),Coin(id: "ethereum", symbol: "eth", fullName: "Ethereum"),Coin(id: "dogecoin", symbol: "doge", fullName: "Dogecoin")]
    func getCoin(id:String) -> Coin
    {
        for c in coins
        {
            if(c.id == id)
            {
                return c
            }
        }
        return Coin(id: "", symbol: "", fullName: "NOT VALID")
    }
}
