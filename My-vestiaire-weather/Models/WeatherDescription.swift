//
//  WeatherDescription.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit
import SwiftyJSON

class WeatherDescription: NSObject {

    var id: Int = 0
    var main: String = ""
    var weatherString: String = ""
    var icon: String = ""
    
    override init() {
        super.init()
    }
    
    init(json: JSON) {
        if let weatherArray = json.array {
            if weatherArray.count > 0 {
                self.id = weatherArray[0]["id"].int ?? 0
                self.main = weatherArray[0]["main"].string ?? ""
                self.weatherString = weatherArray[0]["description"].string ?? ""
                self.icon = weatherArray[0]["icon"].string ?? ""
            }
        }
    }
}
