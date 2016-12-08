//
//  ParisDetailsForecastViewController.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit
import SDWebImage

class ParisDetailsForecastViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var imageWeatherLogo: UIImageView!
    @IBOutlet var labelTemperature: UILabel!
    @IBOutlet var labelWeatherDescription: UILabel!
    @IBOutlet var tableView: UITableView!
    
    let viewModel: ParisDetailsForecastViewModel = ParisDetailsForecastViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.tintColor = UIColor.black
        navigationItem.title = viewModel.weatherDetails.getDayOfWeek()
        labelTemperature.text = viewModel.weatherDetails.getFormattedTemperature(type: "day")
        labelWeatherDescription.text = viewModel.weatherDetails.weatherDescription.weatherString
        tableView.tableFooterView = UIView()
        imageWeatherLogo.sd_setImage(with: URL(string: "\(Constants.Urls.kOpenWeatherLogoUrl)/\(viewModel.weatherDetails.weatherDescription.icon).png")) { (image, error, cacheType, url) in
            
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.kAdditionalForecastDetails) as! AdditionalForecastDetailsCell
        
        switch indexPath.row {
        case 0:
            cell.labelDetailType.text = "Min"
            cell.labelDetailValue.text = viewModel.weatherDetails.getFormattedTemperature(type: "min")
        case 1:
            cell.labelDetailType.text = "Max"
            cell.labelDetailValue.text = viewModel.weatherDetails.getFormattedTemperature(type: "max")
        case 2:
            cell.labelDetailType.text = "Humidity"
            cell.labelDetailValue.text = viewModel.weatherDetails.getFormattedHumidity()
        case 3:
            cell.labelDetailType.text = "Wind Speed"
            cell.labelDetailValue.text = viewModel.weatherDetails.getFormattedWindSpeed()
        case 4:
            cell.labelDetailType.text = "Wind Direction"
            cell.labelDetailValue.text = viewModel.weatherDetails.getFormattedWindDirection()
        default:
            break
        }
        
        return cell
    }
    
    //MARK - IBActions
    
    @IBAction func actionBack() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
}
