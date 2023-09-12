import Foundation

enum NetworkError: Error {
    case requestFailed
    case invalidData
    case decodingError
    case customError(message: String)
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Ağ isteği başarısız oldu."
        case .invalidData:
            return "Geçersiz veri alındı."
        case .decodingError:
            return "Veri çözme hatası oluştu."
        case .customError(let message):
            return message
        }
    }
}
