//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 8.09.2023.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject private var forecastViewModel: ForecastViewModel = ForecastViewModel()
    @State private var city: String = "" // Kullanıcının girdiği şehir adını tutan bir değişken
    
    func kelvinToCelsius(kelvin: Double) -> Int {
        let celsius = Int(kelvin - 273.15)
        return celsius
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Şehir Adı Girin", text: $city) // Kullanıcıdan şehir adı girmesini isteyen bir TextField
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Tahminleri Getir") {
                    Task {
                        await forecastViewModel.fetchForecast(city: city)
                    }
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                List {
                    ForEach(forecastViewModel.forecastList ?? [], id: \.self) { data in
                        Text("Tarih: \(data.dtTxt ?? "N/A")") // Use "N/A" as the default value
                        Text("Sıcaklık: \(kelvinToCelsius(kelvin: data.main?.temp ?? 0))°C")
                    }
                }
            }
            .navigationBarTitle("Weather App")
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
