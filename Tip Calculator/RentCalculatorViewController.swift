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
    @IBOutlet weak var totalCostPerPersonTextField: UITextField!
    
    var isSwitchOn = true
    
    //Switch
    @IBAction func toggleSwitch(_ sender: Any) {
        if(isSwitchOn) {
            isSwitchOn = false
        } else {
            isSwitchOn = true
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
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
    @IBAction func calculateRent(_ sender: Any) {
        
        //Costs
        guard let monthlyBaseRentAmount = Double(monthlyBaseRentTextField.text!) else {
            electricTextField.text = "0"
            gasTextField.text = "0"
            waterTextField.text = "0"
            internetTextField.text = "0"
            subletterTextField.text = "0"
            parkingSpotCostTextField.text = "0"
            numberOfRoommatesTextField.text = "0"
            return
        }
        
        let electricAmount = Double(electricTextField.text!)
        let gasAmount  = Double(gasTextField.text!)
        let waterAmount = Double(waterTextField.text!)
        let internetAmount = Double(internetTextField.text!)
        //End of Costs
        
        //Gains
        let subletterAmount = Double(subletterTextField.text!)
        //End of Gains
        
        //Wildcard
        let parkingSpotCostAmount = Double(parkingSpotCostTextField.text!)
        //End of Wildcard
        
        //Divisibles
        let numberOfRoommatesAmount = Double(numberOfRoommatesTextField.text!)
        //End of Divisibles
        
        //Final Costs
        var totalCostAmount = monthlyBaseRentAmount + electricAmount! + gasAmount! + waterAmount! + internetAmount! - subletterAmount!

        //Check if parking spot is subletted
        if(isSwitchOn) {
            totalCostAmount -= parkingSpotCostAmount!
        } else {
            totalCostAmount += parkingSpotCostAmount!
        }
        
        let totalCostPerPersonAmount = totalCostAmount / (numberOfRoommatesAmount! + 1) // Off by 1 error
        
        totalCostTextField.text = String(format: "$%.2f", totalCostAmount)
        totalCostPerPersonTextField.text = String(format: "$%.2f", totalCostPerPersonAmount)
        //End of Final Costs
    }

}
