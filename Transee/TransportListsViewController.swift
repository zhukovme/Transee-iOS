//
//  TransportListsViewController.swift
//  Transee
//
//  Created by Michael on 07.06.15.
//  Copyright (c) 2015 Transee. All rights reserved.
//

import UIKit

class TransportListsViewController: UIViewController {

    @IBOutlet weak var currentCityLabel: UILabel! {
        didSet { currentCityLabel.text = Cities.currentCity }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
    }
} 