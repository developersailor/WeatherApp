//
//  ForecastView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 25.07.2023.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject private var viewModel: ForecastViewModel = ForecastViewModel()
    var body: some View {
        VStack{
            Button("getforecast", action: {
                Task {
                    let result = await viewModel.fetchForecast(city: "Bursa")
                    print( result ?? "no result")
                }
            })
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView()
    }
}

