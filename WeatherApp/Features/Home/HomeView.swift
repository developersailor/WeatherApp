//
//  HomeView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 2.09.2023.
//

import SwiftUI

struct HomeView: View {
  var body: some View {
    TabView {
      VStack {
        WeatherView()

      }.tabItem {
        Label("Anasayfa", systemImage: "house")
      }
      MyWeatherView()
        .tabItem {
        Label("Konumum", systemImage: "location")
      }

      ForecastView()
        .tabItem {
        Label("Haftalık", systemImage: "calendar")
      }
    }
  }
}

#Preview {
  HomeView()
}
