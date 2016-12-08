//
//  Constants.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit

class Constants: NSObject {
    struct Urls {
        static let kOpenWeatherBaseUrl = "http://api.openweathermap.org/data/2.5"
        static let kForecast = "\(kOpenWeatherBaseUrl)/forecast/daily"
        static let kOpenWeatherLogoUrl = "http://openweathermap.org/img/w"
    }
    
    struct ViewControllerID {
        static let kParisForecastDetails = "ParisForecastDetailsViewController"
    }
    
    struct Keys {
        static let kOpenWeatherApiKey = "648a3aac37935e5b45e09727df728ac2"
    }
    
    struct CellIdentifiers {
        static let kForecastMainDetails = "ForecastDetailsCell"
        static let kAdditionalForecastDetails = "AdditionalForecastDetailsCell"
    }
    
    struct SegueID {
        static let kForecastDetails = "ForecastDetailsSegue"
    }
}
