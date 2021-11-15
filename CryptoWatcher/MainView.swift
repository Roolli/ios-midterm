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
        ZStack {
            Color("Primary")
                .edgesIgnoringSafeArea(.all)
            NavigationView{
                
                
                VStack(alignment: .leading) {
                    NavigationLink(destination: CoinSelector(),isActive: $beginCoinCheckProcess)
                    {
                        EmptyView()
                    }
                    Text("Welcome to the best crypto token price checker app there is!").multilineTextAlignment(.center)
                    HStack {
                        
                        
                        Spacer()
                        Button("Begin!"){
                            beginCoinCheckProcess.toggle()
                        }.padding(20)
                            .foregroundColor(.white)
                            .background(Color.purple)
                        Spacer()
                    }
                }
            }
            
        }.environmentObject(coinService)
            .environmentObject(currencyStore)
            .environmentObject(coinStore)
            .background(Color.black)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
