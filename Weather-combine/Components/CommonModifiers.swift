//
//  CommonModifiers.swift
//  Weather-combine
//
//  Created by Vishnu on 1/27/25.
//

import Foundation
import SwiftUI

struct LoaderModifier: ViewModifier {
    
    var isLoading: Bool

    func body(content: Content) -> some View {
        
        ZStack {
            
            content
                .disabled(isLoading)
                .blur(radius: isLoading ? 3 : 0)

            if isLoading {
                ProgressView()
                    .scaleEffect(1.5)
                    .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            }
        }
    }
}

public extension View {
    
    func loader(_ isLoading: Bool) -> some View {
        
        self.modifier(LoaderModifier(isLoading: isLoading))
    }
}

public extension View {
    
    func fullBackground(imageName: String) -> some View {
        
       return background(
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
       )
    }
}

