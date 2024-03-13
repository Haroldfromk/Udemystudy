//
//  WeatherManager.swift
//  Clima
//
//  Created by Dongik Song on 3/6/24.
//  Copyright © 2024 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

// MARK: - Protocol 생성.

protocol WeatherManagerDelegate{
    func didUpdateWeather(_ weatherManager:WeatherManager, weather : WeatherModel)
    func didFailWithError (error: Error)
}

struct WeatherManager {
    
// MARK: - URL 기본 주소
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=b5005bab606b11d2b82b3dae1b2bc221&units=metric"

    
    var delegate : WeatherManagerDelegate?
    
    
    func fetchWeather (cityName : String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather (latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
            let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
            performRequest(with: urlString)
        }
    
    func performRequest(with urlString : String){
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil { // 에러가 발생하면 출력 여기서는 네트워크 에러 쪽이라고 보면 된다.
                    self.delegate?.didFailWithError(error: error!)
                    return // 여기선 return을 사용하면 함수를 빠져나가 아무것도 하지말라는 것이다
                }
                
                if let safeData = data {
                    if let weather = self.parseJSON(safeData) {
                        self.delegate?.didUpdateWeather(self, weather: weather)
                         
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            return weather
            
           // print(weather.temperatureString)
        } catch { // JSON Decoder Fail
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
    
}



