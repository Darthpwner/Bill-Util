//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/14/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipSelector: UISegmentedControl!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateTip(_ sender: Any) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
//            numberOfPeopleTextField.text = ""
            tipAmountField.text = ""
            totalField.text = ""
            return
        }
        
        var numberOfPeopleAmount = Double(numberOfPeopleTextField.text!)
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = (roundedBillAmount * tipPercentage) / numberOfPeopleAmount!
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.isEditing) {
            billAmountField.text = String(format: "$%.2f", roundedBillAmount)
        }
        tipAmountField.text = String(format: "$%.2f", roundedTipAmount)
        totalField.text = String(format: "$%.2f", totalAmount)
    }

}

