//
//  WeatherViewModel.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 28.08.2023.
//

import Foundation

final class WeatherViewModel: ObservableObject {
    @Published var degree: Double? = 0.01
    @Published var cityName: String? = ""
    @Published var humidity: Int? = 0
    
    
    private let manager = NetworkManager.networkManager
    func fetchWeather(city: String) async  -> Weather? {
        let result = await manager.fetch(path: .weather(city: city), method: .get, type: Weather.self)
        Task{
            DispatchQueue.main.async { [self] in
                degree =  result!.main?.temp
                cityName = result!.name
                humidity = result!.main?.humidity
            }
            return result
        }
        return result
    }
}
