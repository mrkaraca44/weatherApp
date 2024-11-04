//
//  WeatherMgr.swift
//  weatherApp
//
//  Created by Safa Karaca on 10.10.2024.
//

import Foundation
 

class NetworkManager {
    static let shared = NetworkManager()
    typealias Completion = (WeatherResponse) -> Void
     
    
    public func getWeatherResponse(completion: @escaping Completion) {
        let url = URL(string: "https://api.open-meteo.com/v1/forecast?latitude=38.35&longitude=38.31&current=temperature_2m,weather_code%2Cwind_speed_10m")!

       let request = URLRequest(url: url)

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                do{
                    let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
                    completion(weatherResponse)
                    //print(weatherResponse.current.temperature2M)
                } catch {
                    print("error: \(error.localizedDescription)")
                }
                
                //let str = String(data: data, encoding: .utf8)
                //print(str ?? "")
            }
        }

        task.resume()
    }
    
  
    
}

extension Data {
    func printJson() {
        do {
        let json = try JSONSerialization.jsonObject(with: self, options: [])
        let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            guard let jsonString = String(data: data, encoding: .utf8) else {
                print("xxxxxxxxx\ninvalid Data")
                return
            }
            print(jsonString)
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }
}


 
