//
//  CoinPrice.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

struct CoinPrices : Decodable
{
    var prices: Dictionary<String,Double> = [:]
    var coin: String
    
    private struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        
        var intValue: Int?
        
        init?(intValue: Int) {
            return nil
        }
        
        
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        
      
        self.coin = ""
        for key in container.allKeys // should contain just the token as a single value
        {
            self.coin = key.stringValue
            let decodedObject = try container.nestedContainer(keyedBy: DynamicCodingKeys.self, forKey:DynamicCodingKeys(stringValue: key.stringValue)!)
            for currencyKey in decodedObject.allKeys
            {
                let val = try decodedObject.decode(Double.self, forKey: DynamicCodingKeys(stringValue: currencyKey.stringValue)!)
                self.prices["\(currencyKey)"] = val
            }
        }
    }
}
