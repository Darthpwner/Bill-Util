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


}
