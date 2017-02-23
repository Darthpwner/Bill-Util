//
//  CurrencyConvertorViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/22/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit

class CurrencyConvertorViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    var queryAmount: Double = 0
    var usdAmount: Double = 0
    var euroAmount: Double = 0
    var yenAmount: Double = 0
    var poundAmount: Double = 0
    var rmbAmount: Double = 0
    var pesoAmount: Double = 0
    var cadAmount: Double = 0
    
    var locationPickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var euroLabel: UILabel!
    @IBOutlet weak var yenLabel: UILabel!
    @IBOutlet weak var poundLabel: UILabel!
    @IBOutlet weak var rmbLabel: UILabel!
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var pesoLabel: UILabel!
    @IBOutlet weak var currencyUnitLabel: UILabel!
    
    @IBOutlet weak var currencyButton: UIButton!
    @IBOutlet weak var currencyAmountTextField: UITextField!
    
    @IBAction func currencyButtonDidClick(_ sender: Any) {
         locationPickerView.isHidden = false
        print("button clicked")
    }
    
    @IBAction func moneyAmountDidChange(_ sender: Any) {
        queryAmount = Double(currencyAmountTextField.text!)!
        
        updateAmounts(unit: "US Dollar")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view. 
        self.hideKeyboardWhenTappedAround()
        //pickerViewHandler()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Custom PickerView methods
    func pickerViewHandler() {
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
        currencyUnitLabel.text = pickerDataSource[row].state
        currencyUnitLabel.text = "\(pickerDataSource[row].tax * 100)"
    }
    
    func updateAmounts(unit: String) {
        
        switch unit {
        case "US Dollar":
            usdAmount = queryAmount
            euroAmount = queryAmount * 0.95
            yenAmount = queryAmount * 113.20
            poundAmount = queryAmount * 0.80
            cadAmount = queryAmount * 1.32
            pesoAmount = queryAmount * 19.92
            rmbAmount = queryAmount * 6.88
//        case "Euro":
//            usDollarAmount = queryAmount * 1.07
//            euroAmount = queryAmount
//            yenAmount = queryAmount * 122.67
//            poundAmount = queryAmount * 0.86
//            francAmount = queryAmount * 1.07
//            canadianDollarAmount = queryAmount * 1.43
//        case "Yen":
//            usDollarAmount = queryAmount * 0.0087
//            euroAmount = queryAmount * 0.0082
//            yenAmount = queryAmount
//            poundAmount = queryAmount * 0.007
//            francAmount = queryAmount * 0.0087
//            canadianDollarAmount = queryAmount * 0.012
//        case "Pound":
//            usDollarAmount = queryAmount * 1.24
//            euroAmount = queryAmount * 1.16
//            yenAmount = queryAmount * 141.91
//            poundAmount = queryAmount * 1.00
//            francAmount = queryAmount * 1.24
//            canadianDollarAmount = queryAmount * 1.65
//        case "Franc":
//            usDollarAmount = queryAmount
//            euroAmount = queryAmount * 0.93
//            yenAmount = queryAmount * 114.42
//            poundAmount = queryAmount * 0.81
//            francAmount = queryAmount
//            canadianDollarAmount = queryAmount * 1.33
//        case "CA $":
//            usDollarAmount = queryAmount * 0.75
//            euroAmount = queryAmount * 0.7
//            yenAmount = queryAmount * 86.06
//            poundAmount = queryAmount * 0.61
//            francAmount = queryAmount * 0.75
//            canadianDollarAmount = queryAmount
        default:
            usdAmount = 0
            euroAmount = 0
            yenAmount = 0
            poundAmount = 0
            rmbAmount = 0
            cadAmount = 0
            pesoAmount = 0
        }

        usdLabel.text = String(format: "$%.2f", usdAmount)
        euroLabel.text = String(format: "€%.2f", euroAmount)
        yenLabel.text = String(format: "¥%.2f", yenAmount)
        poundLabel.text = String(format: "£%.2f", poundAmount)
        cadLabel.text = String(format: "$%.2f", cadAmount)
        rmbLabel.text = String(format: "¥%.2f", rmbAmount)
        pesoLabel.text = String(format: "$%.2f", pesoAmount)

    }
}
