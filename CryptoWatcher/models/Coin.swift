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
}


