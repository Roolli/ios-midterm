//
//  CoinGeckoService.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import Foundation

class CoinGeckoService: ObservableObject {
    var baseUrl: URLComponents
    init()
    {
        baseUrl = URLComponents()
        baseUrl.host = "api.coingecko.com"
        baseUrl.scheme = "https"
        baseUrl.path = "/api/v3"
    }
    
    
    func loadCurrencies(completion:@escaping ([String]) ->()) {
        var urlBuilder = URLComponents(url:baseUrl.url!,resolvingAgainstBaseURL: true)
        urlBuilder?.path += "/simple/supported_vs_currencies"
        guard let url = urlBuilder?.url
        else {
            print("invalid url")
            return
        }
    
    executeRequest(url:url,completionHandler: completion)
    }
    // nincs használva mert az ÖSSZES létrező coint betölti és évekig tart...
    func getCoins(completion:@escaping ([Coin]) ->()) {
        var urlBuilder = URLComponents(url: baseUrl.url!, resolvingAgainstBaseURL:true)
        urlBuilder?.path += "/coins/list"
        guard let url = urlBuilder?.url
        else {
            print("invalid url")
            return
        }
        executeRequest(url:url,completionHandler: completion)
    }
    
    func getCoinPricesInGivenCurrencies(coin:Coin, currencies: [Currency],completion:@escaping (CoinPrices)->())
    {
        var components = URLComponents(url:baseUrl.url!,resolvingAgainstBaseURL: true)
        components?.path+="/simple/price"
        var queryItems:[URLQueryItem] = []
        let currencies_as_strings = currencies.map({c in
            return c.name
        })
        queryItems.append(URLQueryItem(name:"vs_currencies",value: currencies_as_strings.joined(separator:",")))
        queryItems.append(URLQueryItem(name:"ids",value:coin.id))
        components?.queryItems = queryItems
        guard let url = components?.url
        else {
            print("invalid url")
            return
        }
        executeRequest(url: url, completionHandler: completion)
        
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
