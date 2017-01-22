//
//  SalesTaxCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/21/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class SalesTaxCalculatorViewController: UIViewController {

    var state: [String: Double] = [
        "Alabama": 0.04,
        "Alaska": 0.00,
        "Arizona": 0.056,
        "Arkansas": 0.065,
        "California": 0.075,
        "Colorado": 0.029,
        "Connecticut": 0.0635,
        "Delaware": 0.00,
        "Florida": 0.06,
        "Georgia": 0.04,
        "Hawaii": 0.04,
        "Idaho": 0.06,
        "Illinois": 0.0625,
        "Indiana": 0.07,
        "Iowa": 0.06,
        "Kansas": 0.065,
        "Kentucky": 0.06,
        "Louisiana": 0.04,
        "Maine": 0.055,
        "Maryland": 0.06,
        "Massachusetts": 0.0625,
        "Michigan": 0.06,
        "Minnesota": 0.06875,
        "Mississippi": 0.07,
        "Missouri": 0.04225,
        "Montana": 0.00,
        "Nebraska": 0.0550,
        "Nevada": 0.0685,
        "New Hampshire": 0.00,
        "New Jersey": 0.07,
        "New Mexico": 0.05125,
        "New York": 0.04,
        "North Carolina": 0.0475,
        "North Dakota": 0.05,
        "Ohio": 0.0575,
        "Oklahoma": 0.045,
        "Oregon": 0.00,
        "Pennsylvania": 0.06,
        "Rhode Island": 0.07,
        "South Carolina": 0.06,
        "South Dakota": 0.04,
        "Tennessee": 0.07,
        "Texas": 0.0625,
        "Utah": 0.0595,
        "Vermont": 0.06,
        "Virginia": 0.053,
        "Washington": 0.065,
        "West Virginia": 0.06,
        "Wisconsin": 0.05,
        "Wyoming": 0.04,
        "D.C.": 0.0575        
    ]
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
