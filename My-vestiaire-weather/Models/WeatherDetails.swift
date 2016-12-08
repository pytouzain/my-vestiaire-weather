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
    
    var date: Date = Date()
    var temperature: TemperatureDetails = TemperatureDetails()
    var pressure: Float = 0.0
    var humidity: Int = 0
    var weatherDescription: WeatherDescription = WeatherDescription()
    var windSpeed: Float = 0.0
    var windDirection: Int = 0
    var clouds: Int = 0
    
    init(json: JSON) {
        let unixTimeStamp: TimeInterval = json["dt"].double ?? 0.0
        self.date = Date(timeIntervalSince1970: unixTimeStamp)
        self.temperature = TemperatureDetails(json: json["temp"])
        self.pressure = json["pressure"].float ?? 0.0
        self.humidity = json["humidity"].int ?? 0
        self.weatherDescription = WeatherDescription(json: json["weather"])
        self.windSpeed = json["speed"].float ?? 0.0
        self.windDirection = json["deg"].int ?? 0
        self.clouds = json["clouds"].int ?? 0
    }
    
    func getDayOfWeek() -> String {
        let formatter  = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
        let components = calendar.components([.weekday, .day], from: self.date)
        let weekDay = components.weekday ?? 0
        let day = components.day ?? 0
        
        let currentDateComponents = calendar.components(.day, from: Date())
        let currentDay = currentDateComponents.day ?? 0
        
        if day != 0, currentDay != 0    {
            if day == currentDay {
                return "Today"
            }
        }
        
        switch weekDay {
        case 1:
            return "Sunday"
        case 2:
            return "Monday"
        case 3:
            return "Tuesday"
        case 4:
            return "Wednesday"
        case 5:
            return "Thursday"
        case 6:
            return "Friday"
        case 7:
            return "Saturday"
        default:
            return ""
        }
    }
}
