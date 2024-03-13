//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation


protocol CoinManagerDelegate {
    func didFailWithError (error : Error)
    func didUpdateCoin(_ coinManager : CoinManager, coin : CoinModel)
}

struct CoinManager {
    
    var delegate : CoinManagerDelegate?
    
    let storage = Storage()
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func getCoinPrice(for currency: String){
        
    }
    
    func performRequest(with urlString : String) {
        if let url = URL(string: urlString) { // 1. URL 생성
            
            let session = URLSession(configuration: .default) // 2. URL Session 생성
            
            let task = session.dataTask(with: url) { data, response, error in // 3. Session에 task 부여
                
                if error != nil {
                    
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    if let coin = self.parseJSON(safeData) {
                        self.delegate?.didUpdateCoin(self, coin: coin)
                    }
                }
            }
            
            // 4. task 실시
            task.resume()
        }
    }
    
    func parseJSON(_ coinData : Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try
                decoder.decode(CoinData.self, from: coinData)
                let asset_id_base = decodedData.asset_id_base
                let asset_id_quote = decodedData.asset_id_quote
                let rate = decodedData.rate
                
                let coin = CoinModel(base: asset_id_base, quote: asset_id_quote, rate: rate)
                print(coin)
            return coin
        
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}

