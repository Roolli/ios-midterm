//
//  ImageLoader.swift
//  CryptoWatcher
//
//  Created by roland mikhel on 2021. 11. 18..
//

import Foundation
import Combine

class ImageLoader: ObservableObject
{
    var didChange = PassthroughSubject<Data,Never>()
    var data = Data()
    {
        didSet{
            didChange.send(data)
        }
    }
    
    func loadPictureFromURL(urlString:String)
    {
        guard let url = URL(string: urlString)
        else {
            return
        }
        let task = URLSession.shared.dataTask(with: url){
            data,response, err in
                guard let data = data
                else {
                    return
                }
            DispatchQueue.main.async{
                self.data = data
            }
            
        }
        task.resume()
    }
}
