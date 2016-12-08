//
//  ParisForecastViewController.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit

class ParisForecastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let viewModel: ParisForecastViewModel = ParisForecastViewModel()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.tableFooterView = UIView()
        viewModel.requestForecast(success: { 
            self.tableView.reloadData()
            }) { 
                print("Display error")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK - UITableView Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.forecastDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.kForecastDetails) as! ForecastDetailsCell
        let forecastDetails = viewModel.forecastDetails[indexPath.row]
        cell.labelDayOfTheWeek.text = forecastDetails.getDayOfWeek()
        cell.labelWeatherDescription.text = forecastDetails.weatherDescription.weatherString.capitalized
        cell.labelTemperature.text = "\(lround(Double(forecastDetails.temperature.day)))°C"
        return cell
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
