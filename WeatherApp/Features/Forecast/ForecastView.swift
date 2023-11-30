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
              ForecastListView(forecastViewModel: forecastViewModel,
                            kelvinToCelsius: kelvinToCelsius,
                            dateFormatter: dateFormatter,
                            forecastList: forecastViewModel.forecastList ?? [])

            }
            
        }
    }
}



struct ForecastListView: View {
    var forecastViewModel: ForecastViewModel
    var kelvinToCelsius: (Double) -> Int
    var dateFormatter: DateFormatter
    var forecastList: [Liste]

    var body: some View {
        List {
            let forecastList = forecastList

            ForEach(forecastList.indices, id: \.self) { index in
                let data = forecastList[index]

                if let dateText = data.dtTxt, let date = dateFormatter.date(from: dateText) {
                    Section(header: Text("Tarih: \(dateFormatter.string(from: date))")) {
                        Text("Sıcaklık: \(self.kelvinToCelsius(data.main?.temp ?? 0))°C")
                    }
                }
            }
        }
    }
}

#Preview {
  ForecastView()
}
