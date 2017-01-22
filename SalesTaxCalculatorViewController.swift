//
//  SalesTaxCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/21/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class SalesTaxCalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerDataSource: [(state: String, tax: Double)] = [
        ("Alabama", 0.04),
        ("Alaska", 0.00),
        ("Arizona", 0.056),
        ("Arkansas", 0.065),
        ("California", 0.075),
        ("Colorado", 0.029),
        ("Connecticut", 0.0635),
        ("Delaware", 0.00),
        ("Florida", 0.06),
        ("Georgia", 0.04),
        ("Hawaii", 0.04),
        ("Idaho", 0.06),
        ("Illinois", 0.0625),
        ("Indiana", 0.07),
        ("Iowa", 0.06),
        ("Kansas", 0.065),
        ("Kentucky", 0.06),
        ("Louisiana", 0.04),
        ("Maine", 0.055),
        ("Maryland", 0.06),
        ("Massachusetts", 0.0625),
        ("Michigan", 0.06),
        ("Minnesota", 0.06875),
        ("Mississippi", 0.07),
        ("Missouri", 0.04225),
        ("Montana", 0.00),
        ("Nebraska", 0.0550),
        ("Nevada", 0.0685),
        ("New Hampshire", 0.00),
        ("New Jersey", 0.07),
        ("New Mexico", 0.05125),
        ("New York", 0.04),
        ("North Carolina", 0.0475),
        ("North Dakota", 0.05),
        ("Ohio", 0.0575),
        ("Oklahoma", 0.045),
        ("Oregon", 0.00),
        ("Pennsylvania", 0.06),
        ("Rhode Island", 0.07),
        ("South Carolina", 0.06),
        ("South Dakota", 0.04),
        ("Tennessee", 0.07),
        ("Texas", 0.0625),
        ("Utah", 0.0595),
        ("Vermont", 0.06),
        ("Virginia", 0.053),
        ("Washington", 0.065),
        ("West Virginia", 0.06),
        ("Wisconsin", 0.05),
        ("Wyoming", 0.04),
        ("D.C.", 0.0575)
    ]
    
    var locationPickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var salesTaxTextField: UITextField!
    @IBOutlet weak var taxCostTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var totalAmountPerPersonTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)
        
        //PickerView
        pickerViewHandler()
        self.view.addSubview(locationPickerView)
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
    
    //Custom PickerView methods
    func pickerViewHandler () {
        self.locationPickerView.isHidden = true
        self.locationPickerView.dataSource = self
        self.locationPickerView.delegate = self
        
        print(UIScreen.main.bounds.height)
        self.locationPickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 4), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
        self.locationPickerView.backgroundColor = UIColor.white
        self.locationPickerView.layer.borderColor = UIColor.white.cgColor
        self.locationPickerView.layer.borderWidth = 1
    }
    //End of custom PickerView methods
    
    //Boilerplate PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row].state
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        locationTextField.text = pickerDataSource[row].state
        salesTaxTextField.text = "\(pickerDataSource[row].tax * 100)"
    }
    
    @IBAction func setLocation(_ sender: Any) {
        if(locationPickerView.isHidden) {
            locationPickerView.isHidden = false
            
            //Prevent selection of text fields
            billAmountTextField.isUserInteractionEnabled = false
            numberOfPeopleTextField.isUserInteractionEnabled = false
        } else {
            locationPickerView.isHidden = true
            
            //Allow selection of text fields
            billAmountTextField.isUserInteractionEnabled = true
            numberOfPeopleTextField.isUserInteractionEnabled = true
        }
    }
    
    @IBAction func calculateSalesTax(_ sender: Any) {
        guard let billAmount = Double(billAmountTextField.text!) else {
            //show error
            billAmountTextField.text = ""
            numberOfPeopleTextField.text = "1"
            locationTextField.text = ""
            salesTaxTextField.text = ""
            taxCostTextField.text = ""
            totalAmountTextField.text = ""
            totalAmountPerPersonTextField.text = ""
            return
        }
        
        var numberOfPeopleAmount = Double(numberOfPeopleTextField.text!)
        
        if numberOfPeopleTextField.text == "" {
            numberOfPeopleTextField.text = "1";
            numberOfPeopleAmount = 1
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        
        let taxCostAmount = Double(salesTaxTextField.text!)! * roundedBillAmount / 100
        let totalAmount = roundedBillAmount + taxCostAmount
        let totalAmountPerPerson = totalAmount / numberOfPeopleAmount!
        
        billAmountTextField.text = String(format: "%.2f", roundedBillAmount)
        taxCostTextField.text = String(format: "$%.2f", taxCostAmount)
        totalAmountTextField.text = String(format: "$%.2f", totalAmount)
        totalAmountPerPersonTextField.text = String(format: "$%.2f", totalAmountPerPerson)
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
