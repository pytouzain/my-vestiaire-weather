//
//  TemperatureDetails.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit
import SwiftyJSON

class TemperatureDetails: NSObject {

    var day: Float = 0.0
    var night: Float = 0.0
    var evening: Float = 0.0
    var morning: Float = 0.0
    var min: Float = 0.0
    var max: Float = 0.0
    
    override init () {
        super.init()
    }
    
    init (json: JSON) {
        self.day = json["day"].float ?? 0.0
        self.night = json["night"].float ?? 0.0
        self.evening = json["eve"].float ?? 0.0
        self.morning = json["morn"].float ?? 0.0
        self.min = json["min"].float ?? 0.0
        self.max = json["max"].float ?? 0.0
    }
}
