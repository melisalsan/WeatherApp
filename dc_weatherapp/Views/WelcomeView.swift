//
//  WelcomeView.swift
//  dc_weatherapp
//
//  Created by Melis Alsan on 24.07.2023.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    
    
    
    var body: some View {
        VStack {
            VStack(spacing: 20){
                Text("Welcome to Melis's Cheap Weather App")
                    .bold()
                    .font(.title)
                
                Text("please share your location to learn about the weather in your region" )
                    
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
            
            
            LocationButton(.shareCurrentLocation) {
                locationManager.requestLocation()
            }
            .font(.title2)
            .cornerRadius(10)
            .symbolVariant(.fill)
            .foregroundColor(Color.white)
            .hoverEffect(/*@START_MENU_TOKEN@*/.lift/*@END_MENU_TOKEN@*/)
            .padding()

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
