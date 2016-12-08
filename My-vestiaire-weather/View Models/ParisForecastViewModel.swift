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
    
    func requestForecast (success: @escaping ()->(), failure: @escaping ()->()) {
        ApiHandler.instance.getParisFiveDaysWeatherForecast(url: createForecastURL(), success: { (json) in
            if let list = json["list"].array {
                for periodJson in list {
                    self.forecastDetails.append(WeatherDetails(json: periodJson))
                    print(self.forecastDetails.last?.getDayOfWeek())
                    print(self.forecastDetails.last?.weatherDescription.weatherString)
                }
            }
            success()
        }) { (error) in
            print("ERROR")
            print(error)
            failure()
        }
    }
    
    private func createForecastURL() -> String {
        return "\(Constants.Urls.kForecast)?q=Paris&units=metric&cnt=5&APPID=\(Constants.Keys.kOpenWeatherApiKey)"
    }
}
