//
//  CurrencySelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CurrencySelector: View {
    @State private var multiSelection = Set<UUID>()
    let selectedCoin: String
    @State private var doLookup = false;
    @EnvironmentObject var currencyStore: CurrencyStore
    @EnvironmentObject var coinService: CoinGeckoService
    var body: some View {
        NavigationView{
            VStack {
                
                Text("\(multiSelection.count) selected")
                Spacer().frame(width: 20, height: 30, alignment: .center)
                Button("Check"){
                    self.doLookup = true
                }.foregroundColor(Color.green)
                List(selection: $multiSelection) {
                    ForEach(currencyStore.currencies,id:\.id)
                    {currency in
                        Text("\(currency.name)")
                    }
                }.onAppear() {
                    coinService.loadCurrencies(completion: {
                        (currsStr) in
                        currsStr.forEach {val in
                            currencyStore.addCurrency(curr:Currency(name: val))
                        }
                        
                    })
                }
                NavigationLink(destination: CoinPriceLister( selectedCurrencies: multiSelection,selectedCoin: selectedCoin),isActive:$doLookup)
                {
                    EmptyView()
                }
                .toolbar{
                    ToolbarItem(placement: .principal)
                    {
                        Text("Select currency!")
                        
                    }
                    ToolbarItem(placement: .automatic){
                        EditButton()
                        
                    }
                }.navigationBarTitleDisplayMode(.inline).navigationViewStyle(.stack)
                    .navigationBarBackButtonHidden(true)
                    
                    
            }
        }
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        
        CurrencySelector(selectedCoin: "bitcoin").environmentObject(CurrencyStore()).environmentObject(CoinGeckoService())
    }
}
