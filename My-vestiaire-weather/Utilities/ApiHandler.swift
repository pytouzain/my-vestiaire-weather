//
//  ApiHandler.swift
//  My-vestiaire-weather
//
//  Created by Pierre-Yves Touzain on 08/12/2016.
//  Copyright © 2016 Pierre-Yves Touzain. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

public class ApiHandler: NSObject {
    public static let instance:ApiHandler = ApiHandler()
    private override init() {}
    
    private func request(url: URLConvertible, method: HTTPMethod, success: @escaping (JSON)->(), failure: @escaping (Error)->()) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        Alamofire.request(url, method: method, parameters: nil, encoding: JSONEncoding.default, headers: nil).validate().responseJSON { (response) in
            print(response.request?.urlRequest?.url)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                success(json)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    func getParisFiveDaysWeatherForecast(url: String, success: @escaping (JSON)->(), failure: @escaping (Error)->()) {
        request(url: url, method: .get, success: success, failure: failure)
    }
}
