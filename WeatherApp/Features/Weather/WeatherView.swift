import SwiftUI

struct WeatherView: View {
    @ObservedObject private var viewModel: WeatherViewModel = WeatherViewModel()
    @State private var city: String = ""

    var body: some View {
        VStack {
            Spacer()
            
            TextField("Bulunduğun şehir neresi?", text: $city)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 20)
                .font(.custom(Font.robotoRegular.getFont(), size: 20))
            
            Button(action: {
                Task {
                    let result = await viewModel.fetchWeather(city: city)
                    print(result ?? "no result")
                }
            }) {
                Text("Hava Durumu")
                    .font(.custom(Font.robotoRegular.getFont(), size: 40))
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
            }
  
            
          if let cityName = viewModel.cityName, let degree = viewModel.degree ,let humidity = viewModel.humidity {
                VStack {
                  Text("Sıcaklık: \(viewModel.kelvinToCelcius(kelvin: degree))")
                        .font(.custom(Font.robotoRegular.getFont(), size: 30))
                        .padding(.top, 20)
                        
                  VStack(spacing: 12.0){
                    Text("Nem verisi: \(humidity)")
                      .padding()
                        .font(.custom(Font.robotoRegular.getFont(), size: 30))
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                      Text("Şehir: \(cityName)")
                          .font(.custom(Font.robotoRegular.getFont(), size: 30))
                          .padding(.vertical, 20)
                  }
                    
             
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding(.horizontal, 20)
            Spacer()
            } else {
                Text("Hava durumu bilgisi bekleniyor")
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
              
              Text("Nem verisi: Bekleniyor")
                  .padding()
                  .background(Color(.systemGray6))
                  .cornerRadius(10)
                  .padding(.horizontal, 20)
            }
          Spacer()
            
        }
        .background(Color(.systemBackground))
        .foregroundColor(Color.primary)
    }
}

#Preview {
    WeatherView()
}
