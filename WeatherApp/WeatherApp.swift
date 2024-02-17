//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 22.07.2023.
//

import SwiftUI

@main
struct WeatherApp: App {
  @ObservedObject var _viewModel = WeatherAppViewModel()
  init() {
    _viewModel.getApiKey()
  }
  var body: some Scene {
    WindowGroup {
      if _viewModel.isConnected {
        HomeView()
      }
      else {
        Text("internet yok")
        Button("Yeniden bağlan") {
          _viewModel.restartConnectivity()
        }
      }
    }
  }
}

#Preview {
  HomeView()
}
