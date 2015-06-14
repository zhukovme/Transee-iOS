//
//  ViewController.swift
//  Transee
//
//  Created by Michael on 08.06.15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import UIKit

class CityChooserViewController: UIViewController {

    @IBOutlet var citiesTableView: UITableView!
    
    private struct CityChooser {
        static let SegueIdentifier: String = "Show Transports Of Selected City"
        static let CellIdentifier: String = "CityChooserCell"
        static let CellSelectionBackgroundAlpha: CGFloat = 0.4
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        citiesTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: CityChooser.CellIdentifier)
        self.navigationController?.navigationBar.hidden = true
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Cities.citiesDict.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = citiesTableView.dequeueReusableCellWithIdentifier(CityChooser.CellIdentifier) as! UITableViewCell
        
        cell.textLabel?.text = Array(Cities.citiesDict.keys).sorted(<)[indexPath.row]
        cell.textLabel?.textColor = UIColor.whiteColor()
        
        cell.backgroundColor = UIColor.clearColor()
        cell.contentView.backgroundColor = UIColor.clearColor()
        
        let selectionColor = UIView()
        selectionColor.backgroundColor = UIColor.lightTextColor().colorWithAlphaComponent(CityChooser.CellSelectionBackgroundAlpha)
        cell.selectedBackgroundView = selectionColor
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cellLabelText = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text {
            performSegueWithIdentifier(CityChooser.SegueIdentifier, sender: cellLabelText)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tlvc = segue.destinationViewController as? TransportListsViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case CityChooser.SegueIdentifier:
                        if let selectedCity = sender as? String {
                            Cities.currentCity = selectedCity
                        }
                    default: break
                }
            }
        }
    }
}

