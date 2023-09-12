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
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss" // Adjust the date format as per your data
        return formatter
    }()
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
                    let forecastList = forecastViewModel.forecastList ?? []

                    ForEach(forecastList.indices, id: \.self) { index in
                        let data = forecastList[index]

                        if let dateText = data.dtTxt, let date = dateFormatter.date(from: dateText) {
                            Section(header: Text("Tarih: \(dateFormatter.string(from: date))")) {
                                Text("Sıcaklık: \(kelvinToCelsius(kelvin: data.main?.temp ?? 0))°C")
                            }

                            if index < forecastList.count - 1 {
                                let nextData = forecastList[index + 1]
                                if let nextDateText = nextData.dtTxt, let nextDate = dateFormatter.date(from: nextDateText) {
                                    let currentDay = Calendar.current.component(.day, from: date)
                                    let nextDay = Calendar.current.component(.day, from: nextDate)

                                    // Check if the day has changed
                                    if currentDay != nextDay {
                                        Section(header: Text("Tarih: \(dateFormatter.string(from: nextDate))")) {
                                            Text("Sıcaklık: \(kelvinToCelsius(kelvin: nextData.main?.temp ?? 0))°C")
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

            }
            .navigationBarTitle("Forecast")
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}
