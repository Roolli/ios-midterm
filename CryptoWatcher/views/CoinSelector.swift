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
        NavigationView{
            
            List(coinStore.coins) { coin in
                
                 HStack{
                     NavigationLink(destination: CurrencySelector(selectedCoin: "\(coin.id)")){
                         Text("\(coin.fullName)").font(.body).fontWeight(.bold)
                     }
                 }
                
            }
        }.toolbar{
            ToolbarItem(placement: .principal){
                Text("Select coins!")
            }
        }.navigationBarTitleDisplayMode(.inline).navigationBarBackButtonHidden(true)
        
    }
}

struct CoinSelector_Previews: PreviewProvider {
    static var previews: some View {
        CoinSelector().environmentObject(CoinStore())
    }
}
