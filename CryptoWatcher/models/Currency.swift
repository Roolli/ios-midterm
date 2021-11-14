//
//  Currency.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 15..
//

import Foundation

struct Currency: Identifiable,Decodable {
    let id = UUID()
    let name: String
    private enum CodingKeys: String,CodingKey {
        case name
    }
}
