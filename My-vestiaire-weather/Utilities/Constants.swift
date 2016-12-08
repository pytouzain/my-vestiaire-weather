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
    }
    
    struct Numerics {
        static let kAnimationDuration = 0.3
    }
    
    struct ViewControllerID {
    }
    
    struct Keys {
        static let kOpenWeatherApiKey = "648a3aac37935e5b45e09727df728ac2"
    }
    
    struct JSONKeys {
    }
}
