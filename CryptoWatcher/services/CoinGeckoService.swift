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
        baseUrl = "https://coingecko.com/api/v3/simple"
    }
    
    
    func loadCurrencies(completion:@escaping ([Currency]) ->()) {
        guard let url = URL(string:baseUrl+"/vs_currencies")
        else {
            print("invalid url")
            return
        }
        executeRequest(url:url,completionHandler: completion)
    }
    func getCoins(completion:@escaping ([Coin]) ->()) {
        guard let url = URL(string:baseUrl+"/coins")
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
        }).resume()    }
}
