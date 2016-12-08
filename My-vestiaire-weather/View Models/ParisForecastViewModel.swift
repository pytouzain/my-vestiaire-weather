//
//  ParisForecastViewModel.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit

class ParisForecastViewModel: NSObject {

    var forecastDetails: [WeatherDetails] = []
    
    func requestForecast () {
        ApiHandler.instance.getParisFiveDaysWeatherForecast(url: createForecastURL(), success: { (json) in
            print("SUCCESS")
            print(json)
            if let list = json["list"].array {
                print("LIST SIZE : \(list.count)")
                for periodJson in list {
                    self.forecastDetails.append(WeatherDetails(json: periodJson))
                    print(self.forecastDetails.last?.date)
                    print(self.forecastDetails.last?.weatherDescription.weatherString)
                }
            }
        }) { (error) in
            print("ERROR")
            print(error)
        }
    }
    
    private func createForecastURL() -> String {
        return "\(Constants.Urls.kForecast)?q=Paris&units=metric&cnt=5&APPID=\(Constants.Keys.kOpenWeatherApiKey)"
    }
}
