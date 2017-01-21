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
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageProgressView: UIProgressView!
    @IBOutlet weak var setTipPercentageButton: UIButton!
    
    
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var tipAmountPerPersonField: UITextField!
    @IBOutlet weak var totalPerPersonField: UITextField!

    @IBOutlet weak var calculateButton: UIButton!
//    var toggle = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
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
    
    @IBAction func setTipPercentage(_ sender: Any) {
        //Create a Picker View here
    }

    @IBAction func calculateTip(_ sender: Any) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            numberOfPeopleTextField.text = ""
            
            tipPercentageLabel.text = "0"

            tipPercentageProgressView.progress = 0
            
            tipAmountField.text = ""
            totalField.text = ""
            tipAmountPerPersonField.text = ""
            totalPerPersonField.text = ""
            return
        }
        
        var numberOfPeopleAmount = Double(numberOfPeopleTextField.text!)
        
        if numberOfPeopleTextField.text == "" {
            numberOfPeopleTextField.text = "1";
            numberOfPeopleAmount = 1
        }
        
        var tipPercentage = 0.0
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = (roundedBillAmount * tipPercentage)
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        let roundedTipAmountPerPerson = roundedTipAmount / numberOfPeopleAmount!
        let totalAmountPerPerson = totalAmount / numberOfPeopleAmount!
        
        billAmountField.text = String(format: "%.2f", roundedBillAmount)
        tipAmountField.text = String(format: "$%.2f", roundedTipAmount)
        totalField.text = String(format: "$%.2f", totalAmount)
        tipAmountPerPersonField.text = String(format: "$%.2f", roundedTipAmountPerPerson)
        totalPerPersonField.text = String(format: "$%.2f", totalAmountPerPerson)
        
//        if(toggle == 0) {
//            toggle = 1
//            calculateButton.setTitle("Clear", for: .normal)
//        } else {
//            toggle = 0
//            calculateButton.setTitle("Calculate", for: .normal)
//        }
    }

}

