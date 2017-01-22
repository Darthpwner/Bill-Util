//
//  CurrencyConverterViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/22/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerDataSource = ["US $", "Euro", "Yen", "Pound", "Franc", "CA $"]
    
    //LHS
    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var queryTextField: UITextField!
    //End of LHS
    
    //RHS
    @IBOutlet weak var usDollarTextField: UITextField!
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var yenTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var francTextField: UITextField!
    @IBOutlet weak var canadianDollarTextField: UITextField!
    //End of RHS
    
    var pickerValue = "US $"
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //Boilerplate PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = pickerDataSource[row]
        print(pickerValue)
    }

    @IBAction func convertCurrency(_ sender: Any) {
        guard let queryAmount = Double(queryTextField.text!) else {
            //show error
            usDollarTextField.text = ""
            euroTextField.text = ""
            yenTextField.text = ""
            poundTextField.text = ""
            francTextField.text = ""
            canadianDollarTextField.text = ""
            return
        }
        
        var usDollarAmount = Double(usDollarTextField.text!)
        var euroAmount = Double(euroTextField.text!)
        var yenAmount = Double(yenTextField.text!)
        var poundAmount = Double(poundTextField.text!)
        var francAmount = Double(francTextField.text!)
        var canadianDollarAmount = Double(canadianDollarTextField.text!)
        
        switch pickerValue {
            case "US $":
                usDollarAmount = queryAmount
                euroAmount = queryAmount * 0.93
                yenAmount = queryAmount * 114.62
                poundAmount = queryAmount * 0.81
                francAmount = queryAmount
                canadianDollarAmount = queryAmount * 1.33
            case "Euro":
                usDollarAmount = queryAmount * 1.07
                euroAmount = queryAmount
                yenAmount = queryAmount * 122.67
                poundAmount = queryAmount * 0.86
                francAmount = queryAmount * 1.07
                canadianDollarAmount = queryAmount * 1.43
            case "Yen":
                usDollarAmount = queryAmount * 0.0087
                euroAmount = queryAmount * 0.0082
                yenAmount = queryAmount
                poundAmount = queryAmount * 0.007
                francAmount = queryAmount * 0.0087
                canadianDollarAmount = queryAmount * 0.012
            case "Pound":
                usDollarAmount = queryAmount * 1.24
                euroAmount = queryAmount * 1.16
                yenAmount = queryAmount * 141.91
                poundAmount = queryAmount * 1.00
                francAmount = queryAmount * 1.24
                canadianDollarAmount = queryAmount * 1.65
            case "Franc":
                usDollarAmount = queryAmount
                euroAmount = queryAmount * 0.93
                yenAmount = queryAmount * 114.42
                poundAmount = queryAmount * 0.81
                francAmount = queryAmount
                canadianDollarAmount = queryAmount * 1.33
            case "CA $":
                usDollarAmount = queryAmount * 0.75
                euroAmount = queryAmount * 0.7
                yenAmount = queryAmount * 86.06
                poundAmount = queryAmount * 0.61
                francAmount = queryAmount * 0.75
                canadianDollarAmount = queryAmount
            default:
                usDollarAmount = 0
                euroAmount = 0
                yenAmount = 0
                poundAmount = 0
                francAmount = 0
                canadianDollarAmount = 0
        }
        
        usDollarTextField.text = String(format: "%.2f", usDollarAmount!)
        euroTextField.text = String(format: "%.2f", euroAmount!)
        yenTextField.text = String(format: "%.2f", yenAmount!)
        poundTextField.text = String(format: "%.2f", poundAmount!)
        francTextField.text = String(format: "%.2f", francAmount!)
        canadianDollarTextField.text = String(format: "%.2f", canadianDollarAmount!)
    }
    
}
