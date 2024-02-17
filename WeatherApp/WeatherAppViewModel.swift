import Foundation
import Connectivity

class WeatherAppViewModel: ObservableObject {
  @Published var isConnected = true
  private let connectivity = Connectivity()

  init() {
    setupConnectivity()
  }
  func getApiKey() {
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
  func setupConnectivity() {
    connectivity.whenConnected = { [weak self] _ in
      self?.updateConnectionStatus(true)
    }

    connectivity.whenDisconnected = { [weak self] _ in
      self?.updateConnectionStatus(false)
    }

    // Bağlantıyı izlemeye başla
    connectivity.startNotifier()
  }

  func updateConnectionStatus(_ isConnected: Bool) {
    DispatchQueue.main.async {
      self.isConnected = isConnected
    }
  }
  func restartConnectivity() {
    connectivity.stopNotifier() // Önceki bağlantı izlemeyi durdur
    setupConnectivity() // Yeni bağlantı izlemeyi başlat
  }
}
