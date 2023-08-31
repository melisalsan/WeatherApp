//
//  ContentView.swift
//  dc_weatherapp
//
//  Created by Melis Alsan on 24.07.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                if let weather = weather {
              
                    WeatherView(weather: weather)
                    
                } else {
                    LoadingView()
                        .task {
                            do {
                               weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("error getting weather data: \(error)")
                            }
                        }
                }
                    
                
            } else {
                if locationManager.isLoading {
                    LoadingView()
                    
                } else {
                    
                    WelcomeView()
                        .environmentObject(locationManager)
                    }
                }
            }
            .background(Color(hue: 0.735, saturation: 0.536, brightness: 0.125))
            .preferredColorScheme(.dark)
                
                
            
      
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
