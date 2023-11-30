import SwiftUI
import CoreLocation
import Combine
import MapKit
struct LocationData: Codable {
    let cityName: String
}

struct MyWeatherView: View {
    @State private var locationData: LocationData?
    @StateObject private var locationManager = LocationManager()
    @ObservedObject private var myWeatherViewModel: MyWeatherViewModel = MyWeatherViewModel()
    

    var body: some View {
        VStack {
     
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
                
            //locationmanagerden gelen verilere göre MapKitte şehir görüntülenecek.
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.location?.coordinate.longitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(height: 300)
                    .padding()
            }
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
#Preview {
  MyWeatherView()
}
