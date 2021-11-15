//
//  CoinGeckoService.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CoinGeckoService: ObservableObject {
    var baseUrl: String
    init()
    {
        baseUrl = "https://api.coingecko.com/api/v3"
    }
    
    
    func loadCurrencies(completion:@escaping ([String]) ->()) {
        guard let url = URL(string:baseUrl+"/simple/supported_vs_currencies")
        else {
            print("invalid url")
            return
        }
    executeRequest(url:url,completionHandler: completion)
    }
    func getCoins(completion:@escaping ([Coin]) ->()) {
        guard let url = URL(string:baseUrl+"/coins/list")
        else {
            print("invalid url")
            return
        }
        executeRequest(url:url,completionHandler: completion)
    }
    func executeRequest<T>(url:URL,completionHandler: @escaping (T)->()) where T : Decodable {
        URLSession.shared.dataTask(with: url, completionHandler: {data,response,error in
           
            let currencies = try! JSONDecoder().decode(T.self,from:data!)
            DispatchQueue.main.async {
                completionHandler(currencies)
            }
        }).resume()
    }
}
