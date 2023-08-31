//
//  WeatherView.swift
//  dc_weatherapp
//
//  Created by Melis Alsan on 26.07.2023.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    
    
    @available(iOS 16.0, *)
    @available(iOS 16.0, *)
    
    
    var body: some View {
        ZStack(alignment: .leading){
            
            VStack{
                VStack(alignment: .leading, spacing: 5) {
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
        

                    
                    VStack {
                        HStack {
                                               
                            Text(weather.main.feelsLike.roundDouble() + "º")
                                .font(.system(size: 100))
                                .fontWeight(.ultraLight)
                                .padding()
                            
                            VStack(spacing: 3) {
                         
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(weather.weather[0].icon)@2x.png")) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .font(.system(size: 65))
                                   
                                } placeholder: {
                                    ProgressView()
                                }
                                
                                
                                
                                
                                
                                Text(weather.weather[0].main)
                                
                            }
                            .frame(maxWidth: 80, alignment: .leading)
                            
                            
                            
                            Spacer()
                            
                        }
                        .frame(alignment: .trailing)
                        
                        Spacer()
                            .frame(height: 5)
                        
                        
                        Image("finalv")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                
                       
                        
                        Spacer()
                         
                        
                        
                        
                    }.frame(maxWidth: .infinity)
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack {
                Spacer()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Weather Now")
                        .bold()

                    
                    VStack(spacing: 20){
                        Divider()
                        
                        HStack(alignment: .center){
                            
                            WeatherRow(logo: "thermometer.low", name: "Min Temp", value: (weather.main.tempMin.roundDouble() + "°") )
                            
                            Spacer()
                            
                            WeatherRow(logo: "thermometer.high", name: "Max Temp", value: (weather.main.tempMax.roundDouble() + "°") )
                            
                            Spacer()
                            
                            
                        }
                        
                        HStack{
                            WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%") )
                            
                            Spacer()
                            
                            WeatherRow(logo: "wind", name: "Wind Speed", value: (weather.wind.speed.roundDouble() + "m/s") )
                            
                            Spacer()
                            
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.735, saturation: 0.536, brightness: 0.125))
                .background(.white)
                .cornerRadius(20, corners: [.topLeft, .topRight])
                                 
            }
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue: 0.735, saturation: 0.536, brightness: 0.125))
        .preferredColorScheme(.dark)
        
        
        
        
    }
    

}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView(weather: previewWeather)

    }
}

