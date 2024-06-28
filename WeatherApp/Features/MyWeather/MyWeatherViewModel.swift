//
//  MyWeatherViewModel.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 5.09.2023.
//

import Foundation
import CoreLocation

final class MyWeatherViewModel: ObservableObject {
  @Published var degree: Double? = nil
  @Published var cityName: String? = nil
  @Published var humidity: Int? = nil
  @Published var weatherData: OpenWeatherMap? = nil
  private let manager = NetworkManager.networkManager
  func fetchLocalWeather(location: CLLocation) async {
    let result = await manager.fetch(path: .weatherLanLat(location: location), method: .get, type: OpenWeatherMap.self)
    Task {
      DispatchQueue.main.async { [self] in
        degree = result?.main?.temp
        cityName = result?.name
        humidity = result?.main?.humidity
      }
    }
  }
}
