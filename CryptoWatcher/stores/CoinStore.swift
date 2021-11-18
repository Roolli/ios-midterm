//
//  CoinStore.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CoinStore: ObservableObject {
    @Published var coins:[Coin] = [Coin(id:"bitcoin",symbol:"btc",fullName:"Bitcoin",
                                        picture: "https://cryptologos.cc/logos/bitcoin-btc-logo.png?v=014")
                                   ,Coin(id: "tether", symbol: "usdt", fullName: "Tether",picture:"https://cryptologos.cc/logos/tether-usdt-logo.png")
                                   ,Coin(id: "ethereum", symbol: "eth", fullName: "Ethereum",picture:"https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Ethereum_logo_2014.svg/471px-Ethereum_logo_2014.svg.png"),
                                   Coin(id: "dogecoin", symbol: "doge", fullName: "Dogecoin",picture:"https://cryptologos.cc/logos/dogecoin-doge-logo.png?v=014")]
    func getCoin(id:String) -> Coin
    {
        for c in coins
        {
            if(c.id == id)
            {
                return c
            }
        }
        return Coin(id: "", symbol: "", fullName: "NOT VALID",picture: "")
    }
}
