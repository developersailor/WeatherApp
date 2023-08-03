//
//  ForecastViewModel.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 24.07.2023.
//

import Foundation

final class ForecastViewModel: ObservableObject {
    private let manager = NetworkManager.networkManager
    func fetchForecast(city: String) async -> Weather? {
        let result = await manager.fetch(path:.forecast(city: city), method: .get, type: Weather.self)
        
        return result
    }

}

