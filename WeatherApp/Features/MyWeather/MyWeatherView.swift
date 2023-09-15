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
    
    var body: some View {
        VStack {
            
                //Button ile arama isteği atılacak
                // CoreLocation kütüphanesinden aldığım koordinatlar ile OpenWeatherMap API'sine istek atarak hava durumu bilgilerini alıyorum.
                
                Button("Get Local Weather") {
                    locationManager.requestLocation()
                    if let location = locationManager.location {
                        Task {
                            await myWeatherViewModel.fetchLocalWeather(location: location)
                        }
                    }
                }.padding()
            if let degree = myWeatherViewModel.degree, let city = myWeatherViewModel.cityName, let humidity = myWeatherViewModel.humidity {
                Text("\(degree.formatted())°C")
                    .font(.system(size: 50))
                    .bold()
                Text(city)
                    .font(.system(size: 30))
                Text("Humidity: \(humidity)")
                    .font(.system(size: 20))
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
}
