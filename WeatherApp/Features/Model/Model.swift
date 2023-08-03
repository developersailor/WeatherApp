// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weather = try Weather(json)

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
    let alerts: Alerts

    enum CodingKeys: String, CodingKey {
        case location = "location"
        case current = "current"
        case forecast = "forecast"
        case alerts = "alerts"
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
        location: Location? = nil,
        current: Current? = nil,
        forecast: Forecast? = nil,
        alerts: Alerts? = nil
    ) -> Weather {
        return Weather(
            location: location ?? self.location,
            current: current ?? self.current,
            forecast: forecast ?? self.forecast,
            alerts: alerts ?? self.alerts
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Alerts
struct Alerts: Codable {
    let alert: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case alert = "alert"
    }
}

// MARK: Alerts convenience initializers and mutators

extension Alerts {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Alerts.self, from: data)
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
        alert: [JSONAny]? = nil
    ) -> Alerts {
        return Alerts(
            alert: alert ?? self.alert
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Current
struct Current: Codable {
    let lastUpdatedEpoch: Int
    let lastUpdated: String
    let tempC: Int
    let tempF: Int
    let isDay: Int
    let condition: Condition
    let windMph: Double
    let windKph: Int
    let windDegree: Int
    let windDir: String
    let pressureMB: Int
    let pressureIn: Double
    let precipMm: Int
    let precipIn: Int
    let humidity: Int
    let cloud: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let visKM: Int
    let visMiles: Int
    let uv: Int
    let gustMph: Double
    let gustKph: Int
    let airQuality: [String: Double]

    enum CodingKeys: String, CodingKey {
        case lastUpdatedEpoch = "last_updated_epoch"
        case lastUpdated = "last_updated"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case uv = "uv"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case airQuality = "air_quality"
    }
}

// MARK: Current convenience initializers and mutators

extension Current {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Current.self, from: data)
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
        lastUpdatedEpoch: Int? = nil,
        lastUpdated: String? = nil,
        tempC: Int? = nil,
        tempF: Int? = nil,
        isDay: Int? = nil,
        condition: Condition? = nil,
        windMph: Double? = nil,
        windKph: Int? = nil,
        windDegree: Int? = nil,
        windDir: String? = nil,
        pressureMB: Int? = nil,
        pressureIn: Double? = nil,
        precipMm: Int? = nil,
        precipIn: Int? = nil,
        humidity: Int? = nil,
        cloud: Int? = nil,
        feelslikeC: Double? = nil,
        feelslikeF: Double? = nil,
        visKM: Int? = nil,
        visMiles: Int? = nil,
        uv: Int? = nil,
        gustMph: Double? = nil,
        gustKph: Int? = nil,
        airQuality: [String: Double]? = nil
    ) -> Current {
        return Current(
            lastUpdatedEpoch: lastUpdatedEpoch ?? self.lastUpdatedEpoch,
            lastUpdated: lastUpdated ?? self.lastUpdated,
            tempC: tempC ?? self.tempC,
            tempF: tempF ?? self.tempF,
            isDay: isDay ?? self.isDay,
            condition: condition ?? self.condition,
            windMph: windMph ?? self.windMph,
            windKph: windKph ?? self.windKph,
            windDegree: windDegree ?? self.windDegree,
            windDir: windDir ?? self.windDir,
            pressureMB: pressureMB ?? self.pressureMB,
            pressureIn: pressureIn ?? self.pressureIn,
            precipMm: precipMm ?? self.precipMm,
            precipIn: precipIn ?? self.precipIn,
            humidity: humidity ?? self.humidity,
            cloud: cloud ?? self.cloud,
            feelslikeC: feelslikeC ?? self.feelslikeC,
            feelslikeF: feelslikeF ?? self.feelslikeF,
            visKM: visKM ?? self.visKM,
            visMiles: visMiles ?? self.visMiles,
            uv: uv ?? self.uv,
            gustMph: gustMph ?? self.gustMph,
            gustKph: gustKph ?? self.gustKph,
            airQuality: airQuality ?? self.airQuality
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: Text
    let icon: Icon
    let code: Int

    enum CodingKeys: String, CodingKey {
        case text = "text"
        case icon = "icon"
        case code = "code"
    }
}

// MARK: Condition convenience initializers and mutators

extension Condition {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Condition.self, from: data)
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
        text: Text? = nil,
        icon: Icon? = nil,
        code: Int? = nil
    ) -> Condition {
        return Condition(
            text: text ?? self.text,
            icon: icon ?? self.icon,
            code: code ?? self.code
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

enum Icon: String, Codable {
    case cdnWeatherapiCOMWeather64X64Day113PNG = "//cdn.weatherapi.com/weather/64x64/day/113.png"
    case cdnWeatherapiCOMWeather64X64Night113PNG = "//cdn.weatherapi.com/weather/64x64/night/113.png"
}

enum Text: String, Codable {
    case clear = "Clear"
    case sunny = "Sunny"
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]

    enum CodingKeys: String, CodingKey {
        case forecastday = "forecastday"
    }
}

// MARK: Forecast convenience initializers and mutators

extension Forecast {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecast.self, from: data)
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
        forecastday: [Forecastday]? = nil
    ) -> Forecast {
        return Forecast(
            forecastday: forecastday ?? self.forecastday
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String
    let dateEpoch: Int
    let day: Day
    let astro: Astro
    let hour: [Hour]

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case dateEpoch = "date_epoch"
        case day = "day"
        case astro = "astro"
        case hour = "hour"
    }
}

// MARK: Forecastday convenience initializers and mutators

extension Forecastday {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Forecastday.self, from: data)
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
        date: String? = nil,
        dateEpoch: Int? = nil,
        day: Day? = nil,
        astro: Astro? = nil,
        hour: [Hour]? = nil
    ) -> Forecastday {
        return Forecastday(
            date: date ?? self.date,
            dateEpoch: dateEpoch ?? self.dateEpoch,
            day: day ?? self.day,
            astro: astro ?? self.astro,
            hour: hour ?? self.hour
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Astro
struct Astro: Codable {
    let sunrise: String
    let sunset: String
    let moonrise: String
    let moonset: String
    let moonPhase: String
    let moonIllumination: String
    let isMoonUp: Int
    let isSunUp: Int

    enum CodingKeys: String, CodingKey {
        case sunrise = "sunrise"
        case sunset = "sunset"
        case moonrise = "moonrise"
        case moonset = "moonset"
        case moonPhase = "moon_phase"
        case moonIllumination = "moon_illumination"
        case isMoonUp = "is_moon_up"
        case isSunUp = "is_sun_up"
    }
}

// MARK: Astro convenience initializers and mutators

extension Astro {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Astro.self, from: data)
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
        sunrise: String? = nil,
        sunset: String? = nil,
        moonrise: String? = nil,
        moonset: String? = nil,
        moonPhase: String? = nil,
        moonIllumination: String? = nil,
        isMoonUp: Int? = nil,
        isSunUp: Int? = nil
    ) -> Astro {
        return Astro(
            sunrise: sunrise ?? self.sunrise,
            sunset: sunset ?? self.sunset,
            moonrise: moonrise ?? self.moonrise,
            moonset: moonset ?? self.moonset,
            moonPhase: moonPhase ?? self.moonPhase,
            moonIllumination: moonIllumination ?? self.moonIllumination,
            isMoonUp: isMoonUp ?? self.isMoonUp,
            isSunUp: isSunUp ?? self.isSunUp
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC: Double
    let maxtempF: Double
    let mintempC: Double
    let mintempF: Double
    let avgtempC: Double
    let avgtempF: Double
    let maxwindMph: Double
    let maxwindKph: Double
    let totalprecipMm: Int
    let totalprecipIn: Int
    let totalsnowCM: Int
    let avgvisKM: Int
    let avgvisMiles: Int
    let avghumidity: Int
    let dailyWillItRain: Int
    let dailyChanceOfRain: Int
    let dailyWillItSnow: Int
    let dailyChanceOfSnow: Int
    let condition: Condition
    let uv: Int

    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case maxtempF = "maxtemp_f"
        case mintempC = "mintemp_c"
        case mintempF = "mintemp_f"
        case avgtempC = "avgtemp_c"
        case avgtempF = "avgtemp_f"
        case maxwindMph = "maxwind_mph"
        case maxwindKph = "maxwind_kph"
        case totalprecipMm = "totalprecip_mm"
        case totalprecipIn = "totalprecip_in"
        case totalsnowCM = "totalsnow_cm"
        case avgvisKM = "avgvis_km"
        case avgvisMiles = "avgvis_miles"
        case avghumidity = "avghumidity"
        case dailyWillItRain = "daily_will_it_rain"
        case dailyChanceOfRain = "daily_chance_of_rain"
        case dailyWillItSnow = "daily_will_it_snow"
        case dailyChanceOfSnow = "daily_chance_of_snow"
        case condition = "condition"
        case uv = "uv"
    }
}

// MARK: Day convenience initializers and mutators

extension Day {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Day.self, from: data)
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
        maxtempC: Double? = nil,
        maxtempF: Double? = nil,
        mintempC: Double? = nil,
        mintempF: Double? = nil,
        avgtempC: Double? = nil,
        avgtempF: Double? = nil,
        maxwindMph: Double? = nil,
        maxwindKph: Double? = nil,
        totalprecipMm: Int? = nil,
        totalprecipIn: Int? = nil,
        totalsnowCM: Int? = nil,
        avgvisKM: Int? = nil,
        avgvisMiles: Int? = nil,
        avghumidity: Int? = nil,
        dailyWillItRain: Int? = nil,
        dailyChanceOfRain: Int? = nil,
        dailyWillItSnow: Int? = nil,
        dailyChanceOfSnow: Int? = nil,
        condition: Condition? = nil,
        uv: Int? = nil
    ) -> Day {
        return Day(
            maxtempC: maxtempC ?? self.maxtempC,
            maxtempF: maxtempF ?? self.maxtempF,
            mintempC: mintempC ?? self.mintempC,
            mintempF: mintempF ?? self.mintempF,
            avgtempC: avgtempC ?? self.avgtempC,
            avgtempF: avgtempF ?? self.avgtempF,
            maxwindMph: maxwindMph ?? self.maxwindMph,
            maxwindKph: maxwindKph ?? self.maxwindKph,
            totalprecipMm: totalprecipMm ?? self.totalprecipMm,
            totalprecipIn: totalprecipIn ?? self.totalprecipIn,
            totalsnowCM: totalsnowCM ?? self.totalsnowCM,
            avgvisKM: avgvisKM ?? self.avgvisKM,
            avgvisMiles: avgvisMiles ?? self.avgvisMiles,
            avghumidity: avghumidity ?? self.avghumidity,
            dailyWillItRain: dailyWillItRain ?? self.dailyWillItRain,
            dailyChanceOfRain: dailyChanceOfRain ?? self.dailyChanceOfRain,
            dailyWillItSnow: dailyWillItSnow ?? self.dailyWillItSnow,
            dailyChanceOfSnow: dailyChanceOfSnow ?? self.dailyChanceOfSnow,
            condition: condition ?? self.condition,
            uv: uv ?? self.uv
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Hour
struct Hour: Codable {
    let timeEpoch: Int
    let time: String
    let tempC: Double
    let tempF: Double
    let isDay: Int
    let condition: Condition
    let windMph: Double
    let windKph: Double
    let windDegree: Int
    let windDir: String
    let pressureMB: Int
    let pressureIn: Double
    let precipMm: Int
    let precipIn: Int
    let humidity: Int
    let cloud: Int
    let feelslikeC: Double
    let feelslikeF: Double
    let windchillC: Double
    let windchillF: Double
    let heatindexC: Double
    let heatindexF: Double
    let dewpointC: Double
    let dewpointF: Double
    let willItRain: Int
    let chanceOfRain: Int
    let willItSnow: Int
    let chanceOfSnow: Int
    let visKM: Int
    let visMiles: Int
    let gustMph: Double
    let gustKph: Double
    let uv: Int

    enum CodingKeys: String, CodingKey {
        case timeEpoch = "time_epoch"
        case time = "time"
        case tempC = "temp_c"
        case tempF = "temp_f"
        case isDay = "is_day"
        case condition = "condition"
        case windMph = "wind_mph"
        case windKph = "wind_kph"
        case windDegree = "wind_degree"
        case windDir = "wind_dir"
        case pressureMB = "pressure_mb"
        case pressureIn = "pressure_in"
        case precipMm = "precip_mm"
        case precipIn = "precip_in"
        case humidity = "humidity"
        case cloud = "cloud"
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
        case windchillC = "windchill_c"
        case windchillF = "windchill_f"
        case heatindexC = "heatindex_c"
        case heatindexF = "heatindex_f"
        case dewpointC = "dewpoint_c"
        case dewpointF = "dewpoint_f"
        case willItRain = "will_it_rain"
        case chanceOfRain = "chance_of_rain"
        case willItSnow = "will_it_snow"
        case chanceOfSnow = "chance_of_snow"
        case visKM = "vis_km"
        case visMiles = "vis_miles"
        case gustMph = "gust_mph"
        case gustKph = "gust_kph"
        case uv = "uv"
    }
}

// MARK: Hour convenience initializers and mutators

extension Hour {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Hour.self, from: data)
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
        timeEpoch: Int? = nil,
        time: String? = nil,
        tempC: Double? = nil,
        tempF: Double? = nil,
        isDay: Int? = nil,
        condition: Condition? = nil,
        windMph: Double? = nil,
        windKph: Double? = nil,
        windDegree: Int? = nil,
        windDir: String? = nil,
        pressureMB: Int? = nil,
        pressureIn: Double? = nil,
        precipMm: Int? = nil,
        precipIn: Int? = nil,
        humidity: Int? = nil,
        cloud: Int? = nil,
        feelslikeC: Double? = nil,
        feelslikeF: Double? = nil,
        windchillC: Double? = nil,
        windchillF: Double? = nil,
        heatindexC: Double? = nil,
        heatindexF: Double? = nil,
        dewpointC: Double? = nil,
        dewpointF: Double? = nil,
        willItRain: Int? = nil,
        chanceOfRain: Int? = nil,
        willItSnow: Int? = nil,
        chanceOfSnow: Int? = nil,
        visKM: Int? = nil,
        visMiles: Int? = nil,
        gustMph: Double? = nil,
        gustKph: Double? = nil,
        uv: Int? = nil
    ) -> Hour {
        return Hour(
            timeEpoch: timeEpoch ?? self.timeEpoch,
            time: time ?? self.time,
            tempC: tempC ?? self.tempC,
            tempF: tempF ?? self.tempF,
            isDay: isDay ?? self.isDay,
            condition: condition ?? self.condition,
            windMph: windMph ?? self.windMph,
            windKph: windKph ?? self.windKph,
            windDegree: windDegree ?? self.windDegree,
            windDir: windDir ?? self.windDir,
            pressureMB: pressureMB ?? self.pressureMB,
            pressureIn: pressureIn ?? self.pressureIn,
            precipMm: precipMm ?? self.precipMm,
            precipIn: precipIn ?? self.precipIn,
            humidity: humidity ?? self.humidity,
            cloud: cloud ?? self.cloud,
            feelslikeC: feelslikeC ?? self.feelslikeC,
            feelslikeF: feelslikeF ?? self.feelslikeF,
            windchillC: windchillC ?? self.windchillC,
            windchillF: windchillF ?? self.windchillF,
            heatindexC: heatindexC ?? self.heatindexC,
            heatindexF: heatindexF ?? self.heatindexF,
            dewpointC: dewpointC ?? self.dewpointC,
            dewpointF: dewpointF ?? self.dewpointF,
            willItRain: willItRain ?? self.willItRain,
            chanceOfRain: chanceOfRain ?? self.chanceOfRain,
            willItSnow: willItSnow ?? self.willItSnow,
            chanceOfSnow: chanceOfSnow ?? self.chanceOfSnow,
            visKM: visKM ?? self.visKM,
            visMiles: visMiles ?? self.visMiles,
            gustMph: gustMph ?? self.gustMph,
            gustKph: gustKph ?? self.gustKph,
            uv: uv ?? self.uv
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let tzID: String
    let localtimeEpoch: Int
    let localtime: String

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case region = "region"
        case country = "country"
        case lat = "lat"
        case lon = "lon"
        case tzID = "tz_id"
        case localtimeEpoch = "localtime_epoch"
        case localtime = "localtime"
    }
}

// MARK: Location convenience initializers and mutators

extension Location {
    init(data: Data) throws {
        self = try newJSONDecoder().decode(Location.self, from: data)
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
        name: String? = nil,
        region: String? = nil,
        country: String? = nil,
        lat: Double? = nil,
        lon: Double? = nil,
        tzID: String? = nil,
        localtimeEpoch: Int? = nil,
        localtime: String? = nil
    ) -> Location {
        return Location(
            name: name ?? self.name,
            region: region ?? self.region,
            country: country ?? self.country,
            lat: lat ?? self.lat,
            lon: lon ?? self.lon,
            tzID: tzID ?? self.tzID,
            localtimeEpoch: localtimeEpoch ?? self.localtimeEpoch,
            localtime: localtime ?? self.localtime
        )
    }

    func jsonData() throws -> Data {
        return try newJSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

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

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public func hash(into hasher: inout Hasher) {
        // No-op
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
