//
//  ContentView.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct MainView: View {
    let coinService = CoinGeckoService()
    let coinStore: CoinStore = CoinStore()
    let currencyStore = CurrencyStore()
    @State private var beginCoinCheckProcess = false
    var body: some View {
        NavigationView{
            VStack() {
                Spacer()
                NavigationLink(destination: CoinSelector(),isActive: $beginCoinCheckProcess)
                {
                    EmptyView()
                }.background(Color.black)
                Text("Welcome to the best crypto token price checker app there is!").multilineTextAlignment(.center).font(.headline)
                Button("Begin!"){
                    beginCoinCheckProcess.toggle()
                }.padding(20)
                    .foregroundColor(.white)
                    .background(Color.purple)
                    .cornerRadius(25)
                Spacer()

            }
        }
        .environmentObject(coinService)
            .environmentObject(currencyStore)
            .environmentObject(coinStore)
            .environmentObject(CoinPriceStore(service:coinService))
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
