//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 28.08.2023.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private var viewModel: WeatherViewModel  = WeatherViewModel()
    @State private var city: String = ""
    
    func kelvinToCelcius(kelvin: Double) -> Int {
        let celcius = kelvin - 273.15
        return Int(celcius)
    }
    
    var body: some View {
        VStack{
            Spacer()
            TextField("Bulunduğun şehir neresi?", text: $city).padding(.horizontal, 70).font(.custom(Font.robotoRegular.getFont(), size: 20))
            Button("Hava Durumu", action: {
                Task {
                    let result = await  viewModel.fetchWeather(city: city)
                    print( result ?? "no result")
                }
            }).font(.custom(Font.robotoRegular.getFont(), size: 40))
            Spacer()
        }
        if let cityName = viewModel.cityName, let degree = viewModel.degree {
            VStack {
                Text("Şehir: \(cityName)")
                    .font(.custom(Font.robotoRegular.getFont(), size: 30))
                
                Text("\(String(describing: Double(kelvinToCelcius(kelvin: max(degree, 0)))))℃")
                    .font(.custom(Font.robotoRegular.getFont(), size: 60))
            }
        } else {
            VStack {
                Text("Şehir: ")
                    .font(.custom(Font.robotoRegular.getFont(), size: 30))
                
                Text("°C")
                    .font(.custom(Font.robotoRegular.getFont(), size: 60))
            }
        }
        Spacer()
        if let humidity = viewModel.humidity {
            Text("Nem verisi: \(humidity)")
        } else {
            Text("Nem verisi: Bekleniyor")
        }
    }
}

#Preview {
  WeatherView()
}
