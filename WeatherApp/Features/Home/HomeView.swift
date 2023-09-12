//
//  HomeView.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 2.09.2023.
//

import SwiftUI

struct HomeView: View {
    @State var selectedView: Int = 0

    var body: some View {
        NavigationView {
                    VStack {
                        NavigationLink(destination: WeatherView()) {
                            Text("Hava Durumu")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        
                        NavigationLink(destination: MyWeatherView()) {
                            Text("Kişisel Hava Durumu")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                        NavigationLink(destination: ForecastView()) {
                            Text("Günlük saatlik havadurumu")
                                .font(.largeTitle)
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                        .padding()
                    }
                    .navigationBarTitle("Ana Ekran")
            
            
                }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
