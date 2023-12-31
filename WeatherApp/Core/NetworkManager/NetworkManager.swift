//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 29.07.2023.
//
import CoreLocation
import Alamofire
import Foundation

class NetworkManager: INetworkManager {
    internal var config: NetworkConfig

    init(config: NetworkConfig) {
        self.config = config
    }

    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T? {
        let dataRequest = AF.request("\(config.baseUrl)\(path.rawValue)", method: method)
            .validate()
            .serializingDecodable(T.self)

        let result = await dataRequest.response

        guard let value = result.value else {
            print("ERROR: \(String(describing: result.error))")
            return nil
        }

        return value
    }

    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T? {
        let jsonEncoder = JSONEncoder()
        //        thread
        guard let data = try? jsonEncoder.encode(model) else { return nil }
        guard let dataString = String(data: data, encoding: .utf8) else { return nil }
        let dataRequest = AF.request("\(config.baseUrl)\(path.rawValue)", method: .post, parameters: convertToDictionary(text: dataString))
            .validate()
            .serializingDecodable(T.self)
        let result = await dataRequest.response

        guard let value = result.value else {
            print("ERROR: \(String(describing: result.error))")
            return nil
        }

        return value
    }

    private func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}
enum NetworkPath: RawRepresentable {
    static let apiKey_ = "key"

    static var apiKey: String? {
        return UserDefaults.standard.string(forKey: apiKey_)
    }

    static let baseUrl = "https://api.openweathermap.org/data/2.5/"
    
    case weather(city: String)
    case weatherLanLat( location: CLLocation)
    case forecast(city:String)
    
    var rawValue: String {
        guard let apiKey = NetworkPath.apiKey else {
            fatalError("API anahtarı ayarlanmamış.")
        }

        switch self {
        case .weather(let city):
            return "weather?q=\(city)&appid=\(apiKey)"
        case .weatherLanLat(location: let location):
            return "weather?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&appid=\(apiKey)&units=metric"
        case .forecast(let city):
            return "forecast?q=\(city)&appid=\(apiKey)&cnt=40"
        }
        
    }

    
    init?(rawValue: String) {
        // Gerekirse dönüşüm işlemleri burada yapılabilir
        return nil
    }

    func getPath() -> String {
        return self.rawValue
    }
}

struct NetworkConfig {
    let baseUrl: String
}
protocol INetworkManager {
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T?
    var config: NetworkConfig { get set }
}

extension NetworkManager {
    static let networkManager: INetworkManager = NetworkManager(config: NetworkConfig(baseUrl: NetworkPath.baseUrl))
}

