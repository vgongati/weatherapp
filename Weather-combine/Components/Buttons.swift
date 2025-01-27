//
//  Buttons.swift
//  Weather-combine
//
//  Created by Vishnu on 1/27/25.
//

import SwiftUI

struct RoundedIconButton: View {
    
    let title: String
    let iconName: String
    let backgroundColor: Color
    let foregroundColor: Color
    let action: () -> Void

    var body: some View {
        
        Button(action: action) {
            
            HStack(spacing: 8) {
                
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(foregroundColor)

                if title.count > 0 {
                    
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(foregroundColor)
                }
                
            }
            .padding()
            .frame(minWidth: 50)
            .background(backgroundColor)
            .cornerRadius(12)
            .shadow(radius: 4)
        }
    }
}

struct SampleContentView: View {
    
    var body: some View {
        
        VStack(spacing: 20) {
            
            Spacer()
            RoundedIconButton(
                title: "",
                iconName: "plus",
                backgroundColor: .blue,
                foregroundColor: .white
            ) {
                print("Button clicked!")
            }

            RoundedIconButton(
                title: "Settings",
                iconName: "gearshape",
                backgroundColor: .green,
                foregroundColor: .white
            ) {
                print("Settings tapped!")
            }
            HStack {
                Spacer()
            }
            Spacer()
        }
        .frame(width: .infinity,height: .infinity)
        .background(Color.blue)
        .padding()
    }
}

struct RoundedIconButton_Previews: PreviewProvider {
    
    static var previews: some View {
        
        SampleContentView()
    }
}
