//
//  WeatherModels.swift
//  Weather-combine
//
//  Created by Vishnu on 1/26/25.
//

import Foundation
import Combine

class WeatherService {
    
    private let apiKey = "82b97f67b9b0457f98c220931252601" // Replace with your actual API key
    private let baseURL = "https://api.weatherapi.com/v1/current.json"

    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {
        
        guard let url = URL(string: "\(baseURL)?key=\(apiKey)&q=\(city)&aqi=no") else {
            
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WeatherResponse.self, decoder: JSONDecoder())
            .map { $0.current }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}

struct WeatherCondition: Codable {
    
    let text: String
    let icon: String
}

struct Weather: Codable {
    
    let tempC: Double
    let condition: WeatherCondition
    let windKph: Double
    let humidity: Int
    let feelsLikeC: Double

    enum CodingKeys: String, CodingKey {
        
        case tempC = "temp_c"
        case condition
        case windKph = "wind_kph"
        case humidity
        case feelsLikeC = "feelslike_c"
    }
}

struct WeatherResponse: Codable {
    
    let current: Weather
}
