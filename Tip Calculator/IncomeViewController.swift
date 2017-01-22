//
//  IncomeViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/21/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class IncomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource   {

    //Left text fields
    @IBOutlet weak var leftIncomeTextField: UITextField!
    @IBOutlet weak var leftBonusesTextField: UITextField!
    @IBOutlet weak var leftRSUsTextField: UITextField!
    @IBOutlet weak var left_1_year_earnings_text_field: UITextField!
    @IBOutlet weak var left_2_year_earnings_text_field: UITextField!
    @IBOutlet weak var left_5_year_earnings_text_field: UITextField!
    @IBOutlet weak var left_10_year_earnings_text_field: UITextField!
    @IBOutlet weak var left_20_year_earnings_text_field: UITextField!
    //End of left text fields
    
    //Right text fields
    @IBOutlet weak var rightIncomeTextField: UITextField!
    @IBOutlet weak var rightBonusesTextField: UITextField!
    @IBOutlet weak var rightRSUsTextField: UITextField!
    @IBOutlet weak var right_1_year_earnings_text_field: UITextField!
    @IBOutlet weak var right_2_year_earnings_text_field: UITextField!
    @IBOutlet weak var right_5_year_earnings_text_field: UITextField!
    @IBOutlet weak var right_10_year_earnings_text_field: UITextField!
    @IBOutlet weak var right_20_year_earnings_text_field: UITextField!
    //End of right text fields
    
    //Picker views
    @IBOutlet weak var leftPickerView: UIPickerView!
    @IBOutlet weak var rightPickerView: UIPickerView!
    
    var leftPickerDataSource = ["Hourly", "Monthly", "Yearly"]
    var rightPickerDataSource = ["Hourly", "Monthly", "Yearly"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
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
    
    //Boilerplate Left PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return leftPickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return leftPickerDataSource[row]
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0) {
           
        } else if(row == 1) {

        } else if(row == 2) {

        }
    }
    //

    
    @IBAction func calculateIncomes(_ sender: Any) {
        
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
