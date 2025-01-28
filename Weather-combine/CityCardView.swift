//
//  CityCardView.swift
//  Weather-combine
//
//  Created by Vishnu on 1/27/25.
//

import SwiftUI

struct CityCardView: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white]),
                           startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)

            VStack {
                // Top Bar
                HStack {
                    Text("New York")
                        .font(.title2)
                        .foregroundColor(.white)
                        .bold()
                    Spacer()
                    Text("23 January")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                .padding()

                Spacer()

                // Main Weather Card
                VStack(spacing: 16) {
                    Text("Weather")
                        .font(.headline)
                        .foregroundColor(.white)

                    VStack(spacing: 8) {
                        Image(systemName: "cloud.sun.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.yellow)

                        Text("Cloudy Day")
                            .font(.title3)
                            .foregroundColor(.white)

                        Text("28°")
                            .font(.system(size: 64, weight: .bold))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 300, height: 400)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)

                Spacer()

                // Hourly Forecast
                HStack(spacing: 16) {
                    VStack {
                        Text("Now")
                            .font(.footnote)
                            .foregroundColor(.white)
                        Image(systemName: "cloud.sun.fill")
                            .foregroundColor(.white)
                        Text("28°")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                    VStack {
                        Text("11 AM")
                            .font(.footnote)
                            .foregroundColor(.white)
                        Image(systemName: "cloud.fill")
                            .foregroundColor(.white)
                        Text("26°")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }

                    VStack {
                        Text("12 AM")
                            .font(.footnote)
                            .foregroundColor(.white)
                        Image(systemName: "sun.max.fill")
                            .foregroundColor(.white)
                        Text("30°")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 300, height: 100)
                .background(Color.white.opacity(0.2))
                .cornerRadius(20)

                Spacer()
            }
        }
    }
}

struct CityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CityCardView()
    }
}
