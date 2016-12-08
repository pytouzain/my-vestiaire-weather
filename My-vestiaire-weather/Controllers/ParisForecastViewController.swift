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
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.kForecastMainDetails) as! ForecastDetailsCell
        let forecastDetails = viewModel.forecastDetails[indexPath.row]
        cell.labelDayOfTheWeek.text = forecastDetails.getDayOfWeek()
        cell.labelWeatherDescription.text = forecastDetails.weatherDescription.weatherString
        cell.labelTemperature.text = forecastDetails.getFormattedTemperature(type: "day")
        return cell
    }
    
    //MARK - UITableView Delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: Constants.ViewControllerID.kParisForecastDetails) as? ParisDetailsForecastViewController {
            controller.viewModel.weatherDetails = viewModel.forecastDetails[indexPath.row]
            self.navigationController?.pushViewController(controller, animated: true)
        }
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
