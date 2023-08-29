//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 28.08.2023.
//

import SwiftUI

struct WeatherView: View {
    @ObservedObject private var viewModel: WeatherViewModel  = WeatherViewModel()
    @State private var city: String = ""
    func kelvinToCelcius(kelvin: Double) -> Double {
        let celcius = kelvin - 273.15
        return celcius
    }
    var body: some View {
        VStack{
            TextField("Bulunduğun şehir neresi?", text: $city).padding(.horizontal, 70).font(.custom(Font.robotoRegular.getFont(), size: 20))
            Button("Hava Durumu", action: {
                Task {
                    let result = await  viewModel.fetchWeather(city: city)
                    print( result ?? "no result")
                }
            }).font(.custom(Font.robotoRegular.getFont(), size: 40))
           
        }
        VStack{
            Text("Şehir: \(viewModel.cityName ?? " " )").font(.custom(Font.robotoRegular.getFont(), size: 30))
            Text(" \(String(describing:Int(kelvinToCelcius(kelvin: viewModel.degree!))))℃").font(.custom(Font.robotoRegular.getFont(), size: 60))
        
        }
        Spacer()
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
