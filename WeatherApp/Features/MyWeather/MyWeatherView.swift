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
    @State private var locationFetched: Bool = false

    var body: some View {
        VStack {
            if let degree = myWeatherViewModel.degree, let city = myWeatherViewModel.cityName, let humidity = myWeatherViewModel.humidity {
                Text("\(degree.formatted())°C")
                    .font(.system(size: 50))
                    .bold()
                Text(city)
                    .font(.system(size: 30))
                Text("Humidity: \(humidity)")
                    .font(.system(size: 20))

                // Display the city on the map based on locationManager's location
                Map(coordinateRegion: .constant(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: locationManager.location?.coordinate.latitude ?? 0, longitude: locationManager.location?.coordinate.longitude ?? 0), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))), interactionModes: .all, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .frame(height: 300)
                    .padding()
            } else {
                Text("Fetching weather...")
                    .font(.system(size: 20))
            }
        }
        .onAppear {
            locationManager.requestLocation()
        }
        .onChange(of: locationManager.location) { newLocation in
            // Fetch the weather data once location is available
            if let location = newLocation, !locationFetched {
                locationFetched = true // Avoid fetching multiple times
                Task {
                    await myWeatherViewModel.fetchLocalWeather(location: location)
                }
            }
        }
    }
}

#Preview {
    MyWeatherView()
}
