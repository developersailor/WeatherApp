//
//  NetworkManager.swift
//  WeatherApp
//
//  Created by Mehmet Fışkındal on 29.07.2023.
//

import Alamofire
import Foundation

struct NetworkConfig {
    let baseUrl: String
}

enum NetworkPath: RawRepresentable {
    static let apiKey_ = "key"

    static var apiKey: String? {
        return UserDefaults.standard.string(forKey: apiKey_)
    }

    static let baseUrl = "https://api.weatherapi.com/v1/"
    
    case forecast(city: String)
    
    var rawValue: String {
        switch self {
        case .forecast(let city):
            return "forecast.json?q=\(city)&days=10&aqi=yes&alerts=yes&key=\(NetworkPath.apiKey!)"
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




protocol INetworkManager {
    func fetch<T: Codable>(path: NetworkPath, method: HTTPMethod, type: T.Type) async -> T?
    func post<T: Codable, R: Encodable>(path: NetworkPath, model: R, type: T.Type) async -> T?
    var config: NetworkConfig { get set }
}

extension NetworkManager {
    static let networkManager: INetworkManager = NetworkManager(config: NetworkConfig(baseUrl: NetworkPath.baseUrl))
}

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
