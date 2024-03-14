

import Foundation

protocol CoinProtocol {
    func didUpdateCoin(coinManager : CoinManager, coin : CoinModel)
}

struct CoinManager {
    
    let storage = Storage()
     
    var delegate : CoinProtocol?
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    
    func fetchCoin () {
        let urlString = "\(baseURL)apikey=\(storage.apiKey)"
        performRequest(with: urlString)
    }
    
    func fetchCoin (currecy: String) {
        let urlString = "\(baseURL)\(currecy)?apikey=\(storage.apiKey)"
        performRequest(with: urlString)
    }
    
    func getCoinPrice(for currency: String) {
        fetchCoin(currecy: currency)
    }
    
    func performRequest(with urlString : String) {
        
        if let url = URL(string: urlString) { // 1. URL 생성
            
            let session = URLSession(configuration: .default) // 2. URL Session 생성
            
            let task = session.dataTask(with: url) { data, response, error in // 3. Session에 task 부여
                
                if error != nil { // 에러가 발생하는 경우
                    
                    print(error ?? "Error")
                    
                    return // 리턴을 하여 아무것도 하지 못하게 한다.
                }
                
                if let safeData = data { // 데이터를 정상적으로 받아온다면 옵셔널 바인딩을 해준다.
                    if let coin = self.parseJSON(safeData) { // 클로저 안이라 self를 명시
                                                                  // safeData를 parseJSON을통해 파싱 해준 값을 저장
                        self.delegate?.didUpdateCoin(coinManager: self, coin: coin)
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
            return coin
            
        } catch {
            
            print(error)
            
            return nil
        }
    }
    
}

