// WeatherModel.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModel = try WeatherModel(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - WeatherModel
struct WeatherModel: Codable, Hashable {
    var coord: Coord?
    var weather: [Weather]?
    var base: String?
    var main: WeatherModelMain?
    var visibility: Int?
    var wind: Wind?
    var clouds: Clouds?
    var dt: Int?
    var sys: WeatherModelSys?
    var timezone: Int?
    var id: Int?
    var name: String?
    var cod: Cod?
    var message: Int?
    var cnt: Int?
    var list: [Liste]?
    var city: City?

    enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case base
        case main
        case visibility
        case wind
        case clouds
        case dt
        case sys
        case timezone
        case id
        case name
        case cod
        case message
        case cnt
        case list
        case city
    }
}

// MARK: WeatherModel convenience initializers and mutators

extension WeatherModel {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherModel.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        coord: Coord?? = nil,
        weather: [Weather]?? = nil,
        base: String?? = nil,
        main: WeatherModelMain?? = nil,
        visibility: Int?? = nil,
        wind: Wind?? = nil,
        clouds: Clouds?? = nil,
        dt: Int?? = nil,
        sys: WeatherModelSys?? = nil,
        timezone: Int?? = nil,
        id: Int?? = nil,
        name: String?? = nil,
        cod: Cod?? = nil,
        message: Int?? = nil,
        cnt: Int?? = nil,
        list: [Liste]?? = nil,
        city: City?? = nil
    ) -> WeatherModel {
        return WeatherModel(
            coord: coord ?? self.coord,
            weather: weather ?? self.weather,
            base: base ?? self.base,
            main: main ?? self.main,
            visibility: visibility ?? self.visibility,
            wind: wind ?? self.wind,
            clouds: clouds ?? self.clouds,
            dt: dt ?? self.dt,
            sys: sys ?? self.sys,
            timezone: timezone ?? self.timezone,
            id: id ?? self.id,
            name: name ?? self.name,
            cod: cod ?? self.cod,
            message: message ?? self.message,
            cnt: cnt ?? self.cnt,
            list: list ?? self.list,
            city: city ?? self.city
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// City.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let city = try City(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - City
struct City: Codable, Hashable {
    var id: Int?
    var name: String?
    var coord: Coord?
    var country: String?
    var population: Int?
    var timezone: Int?
    var sunrise: Int?
    var sunset: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case coord
        case country
        case population
        case timezone
        case sunrise
        case sunset
    }
}

// MARK: City convenience initializers and mutators

extension City {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(City.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        name: String?? = nil,
        coord: Coord?? = nil,
        country: String?? = nil,
        population: Int?? = nil,
        timezone: Int?? = nil,
        sunrise: Int?? = nil,
        sunset: Int?? = nil
    ) -> City {
        return City(
            id: id ?? self.id,
            name: name ?? self.name,
            coord: coord ?? self.coord,
            country: country ?? self.country,
            population: population ?? self.population,
            timezone: timezone ?? self.timezone,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Coord.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coord = try Coord(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Coord
struct Coord: Codable, Hashable {
    var lon: Double?
    var lat: Double?

    enum CodingKeys: String, CodingKey {
        case lon
        case lat
    }
}

// MARK: Coord convenience initializers and mutators

extension Coord {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Coord.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        lon: Double?? = nil,
        lat: Double?? = nil
    ) -> Coord {
        return Coord(
            lon: lon ?? self.lon,
            lat: lat ?? self.lat
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Clouds.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let clouds = try Clouds(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Clouds
struct Clouds: Codable, Hashable {
    var all: Int?

    enum CodingKeys: String, CodingKey {
        case all
    }
}

// MARK: Clouds convenience initializers and mutators

extension Clouds {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Clouds.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        all: Int?? = nil
    ) -> Clouds {
        return Clouds(
            all: all ?? self.all
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Cod.swift

import Foundation

enum Cod: Codable, Hashable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(Int.self) {
            self = .integer(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Cod.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Cod"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let x):
            try container.encode(x)
        case .string(let x):
            try container.encode(x)
        }
    }
}

// Liste.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let list = try Liste(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Liste
struct Liste: Codable, Hashable, Identifiable {
    var id: Int?
    var dt: Int?
    var main: ListMain?
    var weather: [Weather]?
    var clouds: Clouds?
    var wind: Wind?
    var visibility: Int?
    var pop: Double?
    var sys: ListSys?
    var dtTxt: String?

    enum CodingKeys: String, CodingKey {
        case dt = "dt"
        case main = "main"
        case weather = "weather"
        case clouds = "clouds"
        case wind = "wind"
        case visibility = "visibility"
        case pop = "pop"
        case sys = "sys"
        case dtTxt = "dt_txt"
    }
}

// MARK: Liste convenience initializers and mutators

extension Liste {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Liste.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        dt: Int?? = nil,
        main: ListMain?? = nil,
        weather: [Weather]?? = nil,
        clouds: Clouds?? = nil,
        wind: Wind?? = nil,
        visibility: Int?? = nil,
        pop: Double?? = nil,
        sys: ListSys?? = nil,
        dtTxt: String?? = nil
    ) -> Liste {
        return Liste(
            dt: dt ?? self.dt,
            main: main ?? self.main,
            weather: weather ?? self.weather,
            clouds: clouds ?? self.clouds,
            wind: wind ?? self.wind,
            visibility: visibility ?? self.visibility,
            pop: pop ?? self.pop,
            sys: sys ?? self.sys,
            dtTxt: dtTxt ?? self.dtTxt
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// ListMain.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listMain = try ListMain(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - ListMain
struct ListMain: Codable, Hashable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var seaLevel: Int?
    var grndLevel: Int?
    var humidity: Int?
    var tempKf: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case seaLevel
        case grndLevel
        case humidity
        case tempKf
    }
}

// MARK: ListMain convenience initializers and mutators

extension ListMain {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ListMain.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        temp: Double?? = nil,
        feelsLike: Double?? = nil,
        tempMin: Double?? = nil,
        tempMax: Double?? = nil,
        pressure: Int?? = nil,
        seaLevel: Int?? = nil,
        grndLevel: Int?? = nil,
        humidity: Int?? = nil,
        tempKf: Double?? = nil
    ) -> ListMain {
        return ListMain(
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            tempMin: tempMin ?? self.tempMin,
            tempMax: tempMax ?? self.tempMax,
            pressure: pressure ?? self.pressure,
            seaLevel: seaLevel ?? self.seaLevel,
            grndLevel: grndLevel ?? self.grndLevel,
            humidity: humidity ?? self.humidity,
            tempKf: tempKf ?? self.tempKf
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// ListSys.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listSys = try ListSys(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - ListSys
struct ListSys: Codable, Hashable {
    var pod: Pod?

    enum CodingKeys: String, CodingKey {
        case pod
    }
}

// MARK: ListSys convenience initializers and mutators

extension ListSys {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(ListSys.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        pod: Pod?? = nil
    ) -> ListSys {
        return ListSys(
            pod: pod ?? self.pod
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Pod.swift

import Foundation

enum Pod: String, Codable, Hashable {
    case d = "d"
    case n = "n"
}

// Weather.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try Weather(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Weather
struct Weather: Codable, Hashable {
    var id: Int?
    var main: MyEnum?
    var description: Description?
    var icon: String?

    enum CodingKeys: String, CodingKey {
        case id
        case main
        case description
        case icon
    }
}

// MARK: Weather convenience initializers and mutators

extension Weather {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Weather.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        id: Int?? = nil,
        main: MyEnum?? = nil,
        description: Description?? = nil,
        icon: String?? = nil
    ) -> Weather {
        return Weather(
            id: id ?? self.id,
            main: main ?? self.main,
            description: description ?? self.description,
            icon: icon ?? self.icon
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// Description.swift

import Foundation

enum Description: String, Codable, Hashable {
    case brokenClouds = "broken clouds"
    case clearSky = "clear sky"
    case fewClouds = "few clouds"
    case overcastClouds = "overcast clouds"
    case scatteredClouds = "scattered clouds"
}

// MyEnum.swift

import Foundation

enum MyEnum: String, Codable, Hashable {
    case clear = "Clear"
    case clouds = "Clouds"
}

// Wind.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let wind = try Wind(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - Wind
struct Wind: Codable, Hashable {
    var speed: Double?
    var deg: Int?
    var gust: Double?

    enum CodingKeys: String, CodingKey {
        case speed
        case deg
        case gust
    }
}

// MARK: Wind convenience initializers and mutators

extension Wind {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Wind.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        speed: Double?? = nil,
        deg: Int?? = nil,
        gust: Double?? = nil
    ) -> Wind {
        return Wind(
            speed: speed ?? self.speed,
            deg: deg ?? self.deg,
            gust: gust ?? self.gust
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// WeatherModelMain.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModelMain = try WeatherModelMain(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - WeatherModelMain
struct WeatherModelMain: Codable, Hashable {
    var temp: Double?
    var feelsLike: Double?
    var tempMin: Double?
    var tempMax: Double?
    var pressure: Int?
    var humidity: Int?
    var seaLevel: Int?
    var grndLevel: Int?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike
        case tempMin
        case tempMax
        case pressure
        case humidity
        case seaLevel
        case grndLevel
    }
}

// MARK: WeatherModelMain convenience initializers and mutators

extension WeatherModelMain {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherModelMain.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        temp: Double?? = nil,
        feelsLike: Double?? = nil,
        tempMin: Double?? = nil,
        tempMax: Double?? = nil,
        pressure: Int?? = nil,
        humidity: Int?? = nil,
        seaLevel: Int?? = nil,
        grndLevel: Int?? = nil
    ) -> WeatherModelMain {
        return WeatherModelMain(
            temp: temp ?? self.temp,
            feelsLike: feelsLike ?? self.feelsLike,
            tempMin: tempMin ?? self.tempMin,
            tempMax: tempMax ?? self.tempMax,
            pressure: pressure ?? self.pressure,
            humidity: humidity ?? self.humidity,
            seaLevel: seaLevel ?? self.seaLevel,
            grndLevel: grndLevel ?? self.grndLevel
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// WeatherModelSys.swift

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherModelSys = try WeatherModelSys(json)
//
// Hashable or Equatable:
// The compiler will not be able to synthesize the implementation of Hashable or Equatable
// for types that require the use of JSONAny, nor will the implementation of Hashable be
// synthesized for types that have collections (such as arrays or dictionaries).

import Foundation

// MARK: - WeatherModelSys
struct WeatherModelSys: Codable, Hashable {
    var type: Int?
    var id: Int?
    var country: String?
    var sunrise: Int?
    var sunset: Int?

    enum CodingKeys: String, CodingKey {
        case type
        case id
        case country
        case sunrise
        case sunset
    }
}

// MARK: WeatherModelSys convenience initializers and mutators

extension WeatherModelSys {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(WeatherModelSys.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func with(
        type: Int?? = nil,
        id: Int?? = nil,
        country: String?? = nil,
        sunrise: Int?? = nil,
        sunset: Int?? = nil
    ) -> WeatherModelSys {
        return WeatherModelSys(
            type: type ?? self.type,
            id: id ?? self.id,
            country: country ?? self.country,
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// JSONSchemaSupport.swift

import Foundation

// MARK: - Helper functions for creating encoders and decoders

func newJSONDecoder() -> JSONDecoder {
    let decoder = JSONDecoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        decoder.dateDecodingStrategy = .iso8601
    }
    return decoder
}

func newJSONEncoder() -> JSONEncoder {
    let encoder = JSONEncoder()
    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
        encoder.dateEncodingStrategy = .iso8601
    }
    return encoder
}
