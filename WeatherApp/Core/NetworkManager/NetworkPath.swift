//
//  NetworkPath.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 15.02.2024.
//

import CoreLocation
enum NetworkPath: RawRepresentable {
  static let apiKey_ = "key"

  static var apiKey: String? {
    return UserDefaults.standard.string(forKey: apiKey_)
  }

  static let baseUrl = "https://api.openweathermap.org/data/2.5/"

  case weather(city: String)
  case weatherLanLat(location: CLLocation)
  case forecast(city: String)

  var rawValue: String {
    guard let apiKey = NetworkPath.apiKey else {
      fatalError("API anahtarı ayarlanmamış.")
    }

    switch self {
    case .weather(let city):
      return "weather?q=\(city)&appid=\(apiKey)"
    case .weatherLanLat(location: let location):
      return "weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey)&units=metric"
    case .forecast(let city):
      return "forecast?q=\(city)&appid=\(apiKey)&cnt=40"
    }

  }


  init?(rawValue: String) {
    // Gerekirse dönüşüm işlemleri burada yapılabilir
    return nil
  }

  func getPath() -> String {
    return self.rawValue
  }
}
