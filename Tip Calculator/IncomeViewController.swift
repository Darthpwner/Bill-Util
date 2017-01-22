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
    
    var leftIncomeType = "Hourly"
    var rightIncomeType = "Hourly"
    
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
    
    //Boilerplate PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView.tag == 0) {
            return leftPickerDataSource.count;
        }
        return rightPickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView.tag == 0) {
            return leftPickerDataSource[row]
        }
        return rightPickerDataSource[row]
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        if(row == 0) {
            if(pickerView.tag == 0) {
                print("Left Hourly")
                leftIncomeType = leftPickerDataSource[row]
            } else {
                print("Right Hourly")
                rightIncomeType = rightPickerDataSource[row]
            }
        } else if(row == 1) {
            if(pickerView.tag == 0) {
                print("Left Monthly")
                leftIncomeType = leftPickerDataSource[row]
            } else {
                print("Right Monthly")
                rightIncomeType = rightPickerDataSource[row]
            }
        } else if(row == 2) {
            if(pickerView.tag == 0) {
                print("Left Yearly")
                leftIncomeType = leftPickerDataSource[row]
            } else {
                print("Right Yearly")
                rightIncomeType = rightPickerDataSource[row]
            }
        }
    }
    //End of Boilerplate PickerView Methods


    
    @IBAction func calculateIncomes(_ sender: Any) {
        guard let leftIncomeAmount = Double(leftIncomeTextField.text!) else {
            //show error
            leftBonusesTextField.text = "0.00"
            leftRSUsTextField.text = "0.00"
            left_1_year_earnings_text_field.text = ""
            left_2_year_earnings_text_field.text = ""
            left_5_year_earnings_text_field.text = ""
            left_10_year_earnings_text_field.text = ""
            left_20_year_earnings_text_field.text = ""
            return
        }
        
        guard let rightIncomeType = Double(rightIncomeTextField.text!) else {
            //show error
            rightBonusesTextField.text = "0.00"
            rightRSUsTextField.text = "0.00"
            right_1_year_earnings_text_field.text = ""
            right_2_year_earnings_text_field.text = ""
            right_5_year_earnings_text_field.text = ""
            right_10_year_earnings_text_field.text = ""
            right_20_year_earnings_text_field.text = ""
            return
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
