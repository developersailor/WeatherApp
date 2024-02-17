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


}
#Preview {
  MyWeatherView()
}
