//
//  CurrencySelector.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 14..
//

import SwiftUI

struct CurrencySelector: View {
    let selectedCoin: String
    @State private var multiSelection = Set<UUID>()
    @State private var image: UIImage = UIImage()
    @State private var doLookup = false;
    @State private var showPopular = true
    @EnvironmentObject var currencyStore: CurrencyStore
    @EnvironmentObject var coinStore: CoinStore
    @EnvironmentObject var coinService: CoinGeckoService
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
            VStack {
                Image(uiImage: image).resizable().aspectRatio(contentMode: .fit).frame(width: 100, height: 100).onReceive(imageLoader.didChange){
                    data in
                    self.image = UIImage(data:data) ?? UIImage()
                }
                Toggle(isOn:  $showPopular){
                    HStack()
                    {
                        Spacer()
                        Text("Show popular options")
                        Spacer()
                    }
                }.onChange(of: showPopular){
                    value in
                    currencyStore.showPopularCurrencySelection(state: value)
                }
                Text("\(multiSelection.count) selected")
                Spacer().frame(width: 20, height: 30, alignment: .center)
                Button("Check"){
                    self.doLookup = true
                }.foregroundColor(Color.green)
                List(selection: $multiSelection) {
                    ForEach(currencyStore.currencies,id:\.id)
                    {currency in
                        HStack()
                        {
                            Spacer()
                            Text("\(currency.name)")
                            Spacer()
                        }.frame(height:50)
                    }.listRowSeparator(.visible).listRowBackground(Color.green).foregroundColor(.primary)
                }.onAppear() {
                    coinService.loadCurrencies(completion: {
                        (currsStr) in
                        currsStr.forEach {val in
                            currencyStore.addCurrency(curr:Currency(name: val))
                        }
                        currencyStore.showPopularCurrencySelection(state: showPopular)
                    })
                    imageLoader.loadPictureFromURL(urlString: coinStore.getCoin(id: selectedCoin).picture)
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
                }
            }
            
        
    }
}

struct CurrencySelector_Previews: PreviewProvider {
    static var previews: some View {
        
        CurrencySelector(selectedCoin: "bitcoin").environmentObject(CurrencyStore()).environmentObject(CoinGeckoService())
    }
}
