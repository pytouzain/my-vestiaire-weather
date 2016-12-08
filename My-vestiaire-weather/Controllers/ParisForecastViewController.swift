//
//  ParisForecastViewController.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit

class ParisForecastViewController: UIViewController {

    let viewModel: ParisForecastViewModel = ParisForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.requestForecast()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    func createParams() -> [String:AnyObject] {
        return ["q": NSString(string: "Paris"), "units" : NSString(string:"metric"), "cnt" : NSNumber.init(value: 5), "appid":NSString(string: Constants.Keys.kOpenWeatherApiKey)]
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
