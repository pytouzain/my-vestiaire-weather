//
//  ParisForecastViewModel.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit

class ParisForecastViewModel: NSObject {

    func requestForecast () {
        ApiHandler.instance.getParisFiveDaysWeatherForecast(url: createForecastURL(), success: { (json) in
            print("SUCCESS")
            print(json)
        }) { (error) in
            print("ERROR")
            print(error)
        }
    }
    
    private func createForecastURL() -> String {
        return "\(Constants.Urls.kForecast)?q=Paris&units=metric&cnt=5&APPID=\(Constants.Keys.kOpenWeatherApiKey)"
    }
}
