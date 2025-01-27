//
//  WeatherViewModelTests.swift
//  Weather-combineTests
//
//  Created by Vishnu on 1/27/25.
//

import XCTest
import Combine
@testable import Weather_combine

class WeatherViewModelTests: XCTestCase {

    var viewModel: WeatherViewModel!
    var mockService: MockWeatherService!
    var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        mockService = MockWeatherService()
        viewModel = WeatherViewModel(weatherService: mockService)
        cancellables = []
    }

    override func tearDown() {
        viewModel = nil
        mockService = nil
        cancellables = nil
        super.tearDown()
    }

    func testFetchWeatherSuccess() {

        // Given
        let expectedWeather = Weather(
            tempC: 25.0,
            condition: WeatherCondition(text: "Sunny", icon: "icon.png"),
            windKph: 15.0,
            humidity: 60,
            feelsLikeC: 27.0
        )
        mockService.weather = expectedWeather

        // When
        let expectation = XCTestExpectation(description: "Fetch weather")
        viewModel.$weather
            .sink { weather in
                if weather == expectedWeather {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.fetchWeather(for: "Test City")

        // Then
        wait(for: [expectation], timeout: 2.0)
        XCTAssertEqual(viewModel.weather, expectedWeather)
        XCTAssertNil(viewModel.errorMessage)
    }

    func testFetchWeatherFailure() {

        // Given
        let expectedError = URLError(.notConnectedToInternet)
        mockService.error = expectedError

        // When
        let expectation = XCTestExpectation(description: "Fetch weather failure")
        viewModel.$errorMessage
            .sink { errorMessage in
                if errorMessage == expectedError.localizedDescription {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)

        viewModel.fetchWeather(for: "Test City")

        // Then
        wait(for: [expectation], timeout: 2.0)
        XCTAssertNil(viewModel.weather)
        XCTAssertEqual(viewModel.errorMessage, expectedError.localizedDescription)
    }
}
