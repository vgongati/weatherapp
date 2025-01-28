//
//  CityCardView2.swift
//  Weather-combine
//
//  Created by Vishnu on 1/27/25.
//

import SwiftUI

struct CityWeatherView: View {
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                // Header Section
                VStack(alignment: .leading, spacing: 8) {
                    Text("New York")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

                    
                    Text("23 January")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding(.horizontal)
                
                // Weather Forecast Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Weather")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("FORECAST")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "cloud.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                        
                        Text("Cloudy Day")
                            .font(.title2)
                            .fontWeight(.medium)
                        
                        Spacer()
                        
                        Text("28°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                    }
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                
                // Timeline Section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Now")
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    HStack {
                        WeatherTimeView(time: "11AM", temperature: "22°")
                        Spacer()
                        WeatherTimeView(time: "12AM", temperature: "20°")
                        Spacer()
                        WeatherTimeView(time: "1PM", temperature: "24°")
                        Spacer()
                        WeatherTimeView(time: "2PM", temperature: "26°")
                    }
                }
                .padding()
                .background(Color.white.opacity(0.2))
                .cornerRadius(10)
                .padding(.horizontal)
                
                Spacer()
            }
            .padding(.top)

        }
    }
}

struct WeatherTimeView: View {
    var time: String
    var temperature: String
    
    var body: some View {
        VStack {
            Text(time)
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Text(temperature)
                .font(.title3)
                .fontWeight(.medium)
        }
    }
}

struct CityWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CityWeatherView()
    }
}
