//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 8.09.2023.
//

import SwiftUI

struct ForecastView: View {
  @ObservedObject private var forecastViewModel: ForecastViewModel = ForecastViewModel()
  @State private var city: String = ""
  
  
  var body: some View {
    NavigationView {
      VStack {
        HStack {
          TextField("Şehir Adı Girin", text: $city)
            .padding()
            .textFieldStyle(RoundedBorderTextFieldStyle())
          Button(action: {
            Task {
              await forecastViewModel.fetchForecast(city: city)
            }
          }) {
            Text("Tahminleri Getir")
              .padding()
              .background(Color.blue)
              .foregroundColor(.white)
              .cornerRadius(10)
          }
        }
        .padding()
        
        ForecastListView(forecastViewModel: forecastViewModel,
                         kelvinToCelsius: forecastViewModel.kelvinToCelsius,
                         dateFormatter: forecastViewModel.dateFormatter,
                         forecastList: forecastViewModel.forecastList ?? [])
      }
    }
    .navigationBarTitle("Hava Durumu")
    .navigationBarItems(trailing: Button(action: {}) {
      Image(systemName: "gearshape")
    })
  }
}


struct ForecastListView: View {
  var forecastViewModel: ForecastViewModel
  var kelvinToCelsius: (Double) -> Int
  var dateFormatter: DateFormatter
  var forecastList: [Liste]

  var body: some View {
    List {
      ForEach(forecastList.indices, id: \.self) { index in
        let data = forecastList[index]

        if let date = dateFormatter.date(from: data.dtTxt ?? "") {
          Section(
            header: Text(date, style: .date)
              .font(.headline)
              .foregroundColor(.blue)
              .padding(.vertical, 5)
          ) {
            ForecastListViewItem(data: data, kelvinToCelsius: kelvinToCelsius)
          }
          .listRowBackground(Color(UIColor.systemGroupedBackground))
        }
      }
    }
    .listStyle(.insetGrouped)
    .accentColor(.blue)
  }
}

struct ForecastListViewItem: View {
  let data: Liste
  let kelvinToCelsius: (Double) -> Int
  var body: some View {
    VStack(alignment: .leading) {
      VStack(alignment: .leading, spacing: 5) {
        HStack{
          Text("Sıcaklık:")
            .fontWeight(.semibold)
          Text("\(kelvinToCelsius(data.main?.temp ?? 0))°C")
            .font(.title2)
        }
        HStack{
          Text("Rüzgar Hızı:")
            .fontWeight(.semibold)
          Text(data.wind?.speed?.description ?? " ")
            .font(.title2)
        }
        HStack{
          Text("Nem:")
            .fontWeight(.semibold)
          Text(data.main?.humidity?.description ?? " ").font(.title2)
        }
        HStack{
          Text("Basınç:")
            .fontWeight(.semibold)
          Text(data.main?.pressure?.description ?? " ").font(.title2)
        }
      }
    }
    .padding(.vertical, 10)
  }
}

#Preview {
  ForecastView()
}
