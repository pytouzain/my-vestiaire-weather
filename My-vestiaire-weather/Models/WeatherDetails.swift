//
//  WeatherDetails.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherDetails: NSObject {
    
    var date: NSDate = NSDate()
    var temperature: TemperatureDetails = TemperatureDetails()
    var pressure: Float = 0.0
    var humidity: Int = 0
    var weatherDescription: WeatherDescription = WeatherDescription()
    var windSpeed: Float = 0.0
    var windDirection: Int = 0
    var clouds: Int = 0
    
    init(json: JSON) {
        let unixTimeStamp: TimeInterval = json["dt"].double ?? 0.0
        self.date = NSDate(timeIntervalSince1970: unixTimeStamp)
        self.temperature = TemperatureDetails(json: json["temp"])
        self.pressure = json["pressure"].float ?? 0.0
        self.humidity = json["humidity"].int ?? 0
        self.weatherDescription = WeatherDescription(json: json["weather"])
        self.windSpeed = json["speed"].float ?? 0.0
        self.windDirection = json["deg"].int ?? 0
        self.clouds = json["clouds"].int ?? 0
    }
}
