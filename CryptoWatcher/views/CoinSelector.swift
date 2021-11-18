//
//  CoinSelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CoinSelector: View {
    @EnvironmentObject var coinStore: CoinStore
    var body: some View {
        
                List(coinStore.coins) { coin in
                    HStack(){
                        Spacer()
                        Text("\(coin.fullName)").font(.body).fontWeight(.bold)
                        NavigationLink(destination: CurrencySelector(selectedCoin: "\(coin.id)")){
                            EmptyView()
                        }
                        Spacer()
                    }.listRowBackground(Color.accentColor).foregroundColor(Color.black)
                }.background(Color.blue)
                Spacer()
            .toolbar{
                ToolbarItem(placement: .principal){
                    Text("Select coin!")
                }
        }
    }
}

struct CoinSelector_Previews: PreviewProvider {
    static var previews: some View {
        CoinSelector().environmentObject(CoinStore())
    }
}
