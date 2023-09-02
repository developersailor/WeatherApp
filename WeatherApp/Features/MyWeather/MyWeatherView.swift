//
//  MyWeatherView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 2.09.2023.
//

import SwiftUI
import CoreLocation
import Combine

struct MyWeatherView: View {
    @ObservedObject private var viewModel: WeatherViewModel  = WeatherViewModel()
    @State private var locationName: String? = ""
    @State private var locationManager = LocationManager()
    func kelvinToCelcius(kelvin: Double) -> Int {
        let celcius = kelvin - 273.15
        return Int(celcius)
    }
    
    var body: some View {
        VStack {
            if(locationName != nil ){
                Text("Yer Adı: \((locationName?.replacingOccurrences(of: " ", with: ""))!)")
                    .font(.title)
            }
        if let cityName = viewModel.cityName, let degree = viewModel.degree {
                    VStack {
                        Text("Şehir: \(cityName)")
                            .font(.custom(Font.robotoRegular.getFont(), size: 30))
                        
                        Text("\(String(describing: Double(kelvinToCelcius(kelvin: max(degree, 0)))))℃")
                            .font(.custom(Font.robotoRegular.getFont(), size: 60))
                    }
                }
            Text("Nem verisi: \(String(describing: viewModel.humidity))")
        }
        .padding()
        .onAppear {
            locationManager.onLocationUpdate = { result in
                switch result {
                case .success(let cityName):
                    self.locationName = cityName
                case .failure(let error):
                    print("Hata: \(error.localizedDescription)")
                }
            }
            locationManager.requestLocation()
            Task{
                await viewModel.fetchWeather(city: locationName ?? "Ankara")
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

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let geocoder = CLGeocoder()
            geocoder.reverseGeocodeLocation(location) { [weak self] placemarks, error in
                if let error = error {
                    self?.onLocationUpdate?(.failure(error))
                } else if let placemark = placemarks?.first {
                    if let cityName = placemark.locality {
                        self?.onLocationUpdate?(.success(cityName))
                    } else {
                        self?.onLocationUpdate?(.failure(NSError(domain: "LocationManager", code: 0, userInfo: [NSLocalizedDescriptionKey: "Şehir adı bulunamadı"])))
                    }
                }
            }
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        onLocationUpdate?(.failure(error))
    }
}
