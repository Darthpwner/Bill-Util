//
//  RentCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/22/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class RentCalculatorViewController: UIViewController {

    @IBOutlet weak var monthlyBaseRentTextField: UITextField!
    @IBOutlet weak var electricTextField: UITextField!
    @IBOutlet weak var gasTextField: UITextField!
    @IBOutlet weak var waterTextField: UITextField!
    @IBOutlet weak var internetTextField: UITextField!
    @IBOutlet weak var subletterTextField: UITextField!
    @IBOutlet weak var parkingSpotCostTextField: UITextField!
    @IBOutlet weak var numberOfRoommatesTextField: UITextField!
    @IBOutlet weak var totalCostTextField: UITextField!
    @IBOutlet var totalCostPerPersonTextField: UIView!
    
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
