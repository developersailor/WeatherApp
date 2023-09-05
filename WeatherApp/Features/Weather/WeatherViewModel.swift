//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 28.08.2023.
//

import Foundation
import SwiftUI
import CoreLocation

final class WeatherViewModel: NSObject, CLLocationManagerDelegate, ObservableObject {
    @Published var degree: Double? = nil
    @Published var cityName: String? = nil
    @Published var humidity: Int? = nil
    private let manager = NetworkManager.networkManager
    func fetchWeather(city: String) async  -> Weather? {
        let result = await manager.fetch(path: .weather(city: city), method: .get, type: Weather.self)
  Task{
            DispatchQueue.main.async { [self] in
                degree =  result?.main?.temp
                cityName = result?.name
                humidity = result?.main?.humidity

            }
            return result
        }
       
        return result
    }
}
