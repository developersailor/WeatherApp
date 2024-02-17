//
//  CoreLocationManager.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 17.02.2024.
//
import CoreLocation
import Combine
import MapKit

import Foundation
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
