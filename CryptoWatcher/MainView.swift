//
//  ContentView.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct MainView: View {
    let coinService = CoinGeckoService()
    var body: some View {
        ZStack {
            Color("primaryDark")
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("AppLogo").resizable()
                Text("APP_DESCRIPTION")
            }
            Spacer()
            
            TabView {
                CoinSelector().tabItem{
                    Text("Select Coin")
                }
                CurrencySelector().tabItem{
                    Text("Select conversion currencies")
                }
            }.navigationViewStyle(StackNavigationViewStyle())
                .accentColor(Color("Primary"))
        }.environmentObject(coinService)
       
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
