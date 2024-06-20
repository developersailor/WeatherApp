//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 28.08.2023.
//

import Foundation
final class WeatherViewModel: ObservableObject {
  @Published var degree: Double? = nil
  @Published var cityName: String? = nil
  @Published var humidity: Int? = nil
  private let manager = NetworkManager.networkManager
  func fetchWeather(city: String) async -> OpenWeatherMap? {
    let result = await manager.fetch(path: .weather(city: city), method: .get, type: OpenWeatherMap.self)
    Task {
      DispatchQueue.main.async { [self] in
        degree = result?.main?.temp
        cityName = result?.name
        humidity = result?.main?.humidity
      }
      return result
    }

    return result
  }

  func kelvinToCelcius(kelvin: Double) -> Double {
    let celcius = kelvin - 273.15
    return celcius
  }
}
