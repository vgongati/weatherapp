//
//  MockWeatherService.swift
//  Weather-combine
//
//  Created by Vishnu on 1/27/25.
//

import Foundation
import Combine

class MockWeatherService: WeatherServiceProtocol {

    var weather: Weather?
    var error: Error?

    func fetchWeather(for city: String) -> AnyPublisher<Weather, Error> {

        if let weather = weather {
            return Just(weather)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        } else if let error = error {
            return Fail(error: error).eraseToAnyPublisher()
        }

        return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
    }
}
