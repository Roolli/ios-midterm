//
//  coin.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

struct Coin: Decodable, Identifiable
{
    var id: String
    var symbol:String
    var fullName:String
    var picture: String
    init(id:String,symbol:String,fullName:String,picture:String)
    {
        self.fullName = fullName
        self.symbol = symbol
        self.id = id
        self.picture = picture
    }
}


