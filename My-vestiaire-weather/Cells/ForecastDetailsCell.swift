//
//  ForecastDetailsCell.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit

class ForecastDetailsCell: UITableViewCell {

    @IBOutlet var labelDayOfTheWeek: UILabel!
    @IBOutlet var labelWeatherDescription: UILabel!
    @IBOutlet var labelTemperature: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
