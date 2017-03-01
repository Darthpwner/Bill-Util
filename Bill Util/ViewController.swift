//
//  ViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/21/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: TipViewUISlider!
    @IBOutlet weak var tipPercentageSlider: TipViewUISlider!
    
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalPerPersonField: UITextField!
    @IBOutlet weak var tipPerPersonField: UITextField!
    
    var tipPercent = 10
    var numberOfPeople = 1
    var tipAmount = 0.00
    var totalAmount = 0.00
    var billAmount = 0.00
    
    let step: Float = 1
    
    @IBAction func billAmountChanged(_ sender: Any) {
        guard let amount = billAmountField.text, !amount.isEmpty else {
            billAmount = 0.00
            totalAmount = billAmount
            
            tipAmount = calculateTip(tipPercentage: tipPercent)
            totalAmount = billAmount + tipAmount
            
            updateAmounts()
            return
        }
        billAmount = Double(amount)!
        totalAmount = billAmount
        
        tipAmount = calculateTip(tipPercentage: tipPercent)
        totalAmount = billAmount + tipAmount
        
        print(tipAmount)
        updateAmounts()
    }
    
    @IBAction func numberOfPeopleChanged(_ sender: Any) {
        numberOfPeople = Int(numberOfPeopleSlider.value)
        numberOfPeopleLabel.text =  "\(numberOfPeople)"
        
        updateAmounts()
    }
    
    @IBAction func tipPercentageChanged(_ sender: Any) {
//        tipPercent = Int(tipPercentageSlider.value)
        
        // increment the slider by 5
        let newSliderValue = roundf(tipPercentageSlider.value/step)*step
        tipPercentageSlider.value = newSliderValue
        tipPercent = Int(tipPercentageSlider.value)
        
        tipPercentageLabel.text =  "\(tipPercent)%"
        
        tipAmount = calculateTip(tipPercentage: tipPercent)
        totalAmount = billAmount + tipAmount
        
        updateAmounts()
    }
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // type anywhere to disable keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        numberOfPeopleLabel.layer.borderWidth = 2
        numberOfPeopleLabel.layer.borderColor = UIColor(red: 255/255, green: 208/255, blue: 150/255, alpha: 1/1).cgColor
        numberOfPeopleLabel.layer.cornerRadius = 5
        
        billAmountField.layer.borderWidth = 2
        billAmountField.layer.borderColor = UIColor(red: 255/255, green: 208/255, blue: 150/255, alpha: 1/1).cgColor
        billAmountField.layer.cornerRadius = 5
        
        tipPercentageLabel.layer.borderWidth = 2
        tipPercentageLabel.layer.borderColor = UIColor(red: 255/255, green: 208/255, blue: 150/255, alpha: 1/1).cgColor
        tipPercentageLabel.layer.cornerRadius = 5
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calculateTip(tipPercentage: Int) -> Double {
        return (Double(tipPercentage)*totalAmount)/100
    }
    
    func updateAmounts() {
        tipAmountField.text = "$\(tipAmount)"
        tipPerPersonField.text = "$\(tipAmount/Double(numberOfPeople))"
        
        // display 2 decimal digits
        let totalStr = String(format: "%.2f", totalAmount)
        totalField.text = "$\(totalStr)"
        
        let totalPerPerson = totalAmount/Double(numberOfPeople)
        let totalPerPersonStr = String(format: "%.2f", totalPerPerson)
        totalPerPersonField.text = "$\(totalPerPersonStr)"
        
        let tipStr = String(format: "%.2f", tipAmount)
        tipAmountField.text = "$\(tipStr)"
        
        let tipPerPercentStr = String(format: "%.2f", tipAmount/Double(numberOfPeople))
        tipPerPersonField.text = "$\(tipPerPercentStr)"
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}

