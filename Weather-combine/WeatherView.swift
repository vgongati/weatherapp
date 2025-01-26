//
//  WeatherView.swift
//  Weather-combine
//
//  Created by Vishnu on 1/26/25.
//

import SwiftUI

struct WeatherView: View {
    
    @StateObject private var viewModel = WeatherViewModel()
    @State private var city: String = "San Francisco"

    var body: some View {
        
        VStack(spacing: 20) {
            
            TextField("Enter city", text: $city)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            if let weather = viewModel.weather {
                
                Text("Temperature: \(weather.tempC, specifier: "%.1f")°C")
                    .font(.largeTitle)
                Text(weather.condition.text)
                    .font(.headline)
                Text("Feels like: \(weather.feelsLikeC, specifier: "%.1f")°C")
                Text("Wind: \(weather.windKph, specifier: "%.1f") kph")
                Text("Humidity: \(weather.humidity)%")
            } else if let errorMessage = viewModel.errorMessage {
                
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                
                Text("Loading...")
            }

            Button("Fetch Weather") {
                
                viewModel.fetchWeather(for: city)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .onAppear {
            
            viewModel.fetchWeather(for: city)
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        WeatherView()
    }
}
