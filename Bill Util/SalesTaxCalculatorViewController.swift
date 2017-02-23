//
//  SalesTaxCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/21/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class SalesTaxCalculatorViewController: UIViewController {
    
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
    
    var taxPercent = 10
    var numberOfPeople = 1
    var taxAmount = 0.00
    var totalAmount = 0.00
    var billAmount = 0.00
    
    @IBAction func billAmountChanged(_ sender: Any) {
        billAmount = Double(billAmountTextField.text!)!
        totalAmount = billAmount
        
        totalAmount = billAmount + taxAmount
        
        print(taxAmount)
    }

    
    @IBAction func numberOfPeopleChanged(_ sender: Any) {
        numberOfPeople = Int(numberOfPeopleSlider.value)
        numberOfPeopleLabel.text =  "\(numberOfPeople)"
        
        //updateAmounts()
    }
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var taxCostTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var totalAmountPerPersonTextField: UITextField!
    @IBOutlet weak var taxCostPerPersonTextField: UITextField!
    @IBOutlet weak var numberOfPeopleSlider: TipViewUISlider!
    @IBOutlet weak var taxPercentageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // type anywhere to disable keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        numberOfPeopleLabel.layer.borderWidth = 2
        numberOfPeopleLabel.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        numberOfPeopleLabel.layer.cornerRadius = 5

        billAmountTextField.layer.borderWidth = 2
        billAmountTextField.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        billAmountTextField.layer.cornerRadius = 5

        taxPercentageLabel.layer.borderWidth = 2
        taxPercentageLabel.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        taxPercentageLabel.layer.cornerRadius = 5
        
        locationTextField.layer.borderWidth = 2
        locationTextField.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        locationTextField.layer.cornerRadius = 5
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func calculateTax(taxPercentage: Int) -> Double {
        return (Double(taxPercentage)*totalAmount)/100
    }
    
    func updateAmounts() {
//        tipAmountField.text = "$\(tipAmount)"
//        tipPerPersonField.text = "$\(tipAmount/Double(numberOfPeople))"
//        
//        // display 2 decimal digits
//        let totalStr = String(format: "%.2f", totalAmount)
//        totalField.text = "$\(totalStr)"
//        
//        let totalPerPerson = totalAmount/Double(numberOfPeople)
//        let totalPerPersonStr = String(format: "%.2f", totalPerPerson)
//        totalPerPersonField.text = "$\(totalPerPersonStr)"
//        
//        let tipStr = String(format: "%.2f", tipAmount)
//        tipAmountField.text = "$\(tipStr)"
//        
//        let tipPerPercentStr = String(format: "%.2f", tipAmount/Double(numberOfPeople))
//        tipPerPersonField.text = "$\(tipPerPercentStr)"
    }
}
