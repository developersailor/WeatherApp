import SwiftUI
import CoreLocation
import Combine

struct LocationData: Codable {
    let cityName: String
}

struct MyWeatherView: View {
    @State private var locationData: LocationData?
    @StateObject private var locationManager = LocationManager()
    @ObservedObject private var myWeatherViewModel: MyWeatherViewModel = MyWeatherViewModel()

    func kelvinToCelcius(kelvin: Double) -> Int {
        let celcius = kelvin - 273.15
        return Int(celcius)
    }

    var body: some View {
        VStack {
            Button("Ara") {
                locationManager.requestLocation()
                locationManager.onLocationUpdate = { result in
                    switch result {
                    case .success(let cityName):
                        let data = LocationData(cityName: cityName)
                        UserDefaults.standard.set(try? PropertyListEncoder().encode(data), forKey: "LocationData")
                        self.locationData = data

                        if let location = locationManager.location {
                            Task {
                                await myWeatherViewModel.fetchLocalWeather(location: location)
                            }
                        }

                    case .failure(let error):
                        print("Error: \(error.localizedDescription)")
                    }
                }
            }
        }

        if let cityName = locationData?.cityName {
            Text("City: \(cityName)")
                .font(.title)

            if let degree = myWeatherViewModel.degree,
                let humidity = myWeatherViewModel.humidity {
                Text("Temperature: \(Int(degree))°C")
                Text("Humidity: \(humidity)%")
                // Add more weather-related information as needed
            } else {
                Text("Fetching weather data...")
            }
        }
    }
}

struct MyWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        MyWeatherView()
    }
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()
    @Published var onLocationUpdate: ((Result<String, Error>) -> Void)?
    @Published var location: CLLocation?

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            self.location = location
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        onLocationUpdate?(.failure(error))
    }
}
