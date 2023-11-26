//
//  HomeView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 2.09.2023.
//

import SwiftUI
import iPages
struct HomeView: View {
    var body: some View {
      iPages{
        WeatherView()
        MyWeatherView()
        ForecastView()
      }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
