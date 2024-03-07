//
//  WeatherManager.swift
//  Clima
//
//  Created by Dongik Song on 3/6/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b5005bab606b11d2b82b3dae1b2bc221&units=metric"
    
    func fetchWeather (cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil { // 에러가 발생하면 출력
                    print(error!)
                    return // 여기선 return을 사용하면 함수를 빠져나가 아무것도 하지말라는 것이다
                }
                
                if let safeData = data {
                    self.parseJSON(weatherData: safeData)
                }
            }

            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].description)
        } catch {
            print(error)
        }
    }
    
}



