//
//  ContentView.swift
//  Weather-combine
//
//  Created by Vishnu on 1/26/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            WeatherView()
        }
        .fullBackground(imageName: "BG")
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
