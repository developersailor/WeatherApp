//
//  WeatherAppApp.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 22.07.2023.
//

import SwiftUI

@main
struct WeatherApp: App {
 init(){
    if let plistPath = Bundle.main.path(forResource: "Keys", ofType: "plist"),
       let keys = NSDictionary(contentsOfFile: plistPath) as? [String: Any],
       let apiKey = keys["key"] as? String {
      UserDefaults.standard.set(apiKey, forKey: "key")
      // Değer almak
      if let savedApiKey = UserDefaults.standard.string(forKey: "key") {
          print("API Key:", savedApiKey)
      }
    } else {
        print("API Key not found.")
    }
  }
  var body: some Scene {
    WindowGroup {
      HomeView()
    }
  }
}

struct WeatherApp_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
