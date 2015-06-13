//
//  TransportListsViewController.swift
//  Transee
//
//  Created by Michael on 07.06.15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import UIKit
import Argo

class TransportListsViewController: UIViewController {

    @IBOutlet weak var currentCityLabel: UILabel! {
        didSet { currentCityLabel.text = CitiesVars.currentCity }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
//        getTranportJson()
        getCities()
    }
    
    func getCities() {
        let data = getJSON("https://transee.in/api/v1/cities")
        
        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)
        
        if let j: AnyObject = json {
            if let cities: [Cities] = decode(j) {
                println(cities)
            }
        }
    }
    
    func getTranportJson() {
        let data = getJSON("https://transee.in/api/v1/cities/\(CitiesVars.citiesDict[CitiesVars.currentCity]!)")
        
        let json: AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions(0), error: nil)
        
        if let j: AnyObject = json {
            if let transportTypes: [TransportType] = decode(j) {
                for transport in transportTypes {
                    println(transport.type)
                }
            }
        }
    }
    
    func getJSON(urlToRequest: String) -> NSData{
        return NSData(contentsOfURL: NSURL(string: urlToRequest)!)!
    }
}