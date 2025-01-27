//
//  WeatherViewModel.swift
//  Weather-combine
//
//  Created by Vishnu on 1/26/25.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {

    @Published var weather: Weather? = nil
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false

    private var cancellables = Set<AnyCancellable>()
    private let weatherService: WeatherServiceProtocol

    init(weatherService: WeatherServiceProtocol) {

        self.weatherService = weatherService
    }

    func fetchWeather(for city: String) {

        isLoading = true
        errorMessage = nil

        weatherService.fetchWeather(for: city)
            .sink(receiveCompletion: { completion in

                self.isLoading = false

                switch completion {

                case .failure(let error):

                    self.errorMessage = error.localizedDescription
                case .finished:

                    break
                }
            }, receiveValue: { [weak self] weather in

                self?.weather = weather
            })
            .store(in: &cancellables)
    }
}
