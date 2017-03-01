//
//  RentCalculatorViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/28/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit

class RentCalculatorViewController: UIViewController {
    
    var baseAmount: Double = 0
    var utitiliesAmount: Double = 0
    var parkingAmount: Double = 0
    var sublettingAmount: Double = 0
    var parkingSubleased: Int = 1
    var totalAmount: Double = 0
    var totalAmountPerPerson: Double = 0
    var numberOfPeople: Int = 1
    
    @IBOutlet weak var baseAmountTextField: UITextField!
    @IBOutlet weak var utilitiesTextField: UITextField!
    @IBOutlet weak var parkingTextField: UITextField!
    @IBOutlet weak var sublettingTextField: UITextField!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var parkingSubleasedSwitch: UISwitch!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var numberOfPeopleSlider: TipViewUISlider!
    @IBOutlet weak var totalPerPersonTextField: UITextField!
    
    @IBAction func monthlyTextFieldDidChange(_ sender: Any) {
        guard let amount = baseAmountTextField.text, !amount.isEmpty else {
            baseAmount = 0.00
            updateAmounts()
            
            return
        }
        
        baseAmount = Double(baseAmountTextField.text!)!
        updateAmounts()
    }
    
    @IBAction func utilitiesTextFieldDidChange(_ sender: Any) {
        guard let amount = utilitiesTextField.text, !amount.isEmpty else {
            utitiliesAmount = 0.00
            updateAmounts()
            
            return
        }
        utitiliesAmount = Double(utilitiesTextField.text!)!
        updateAmounts()
    }
    
    @IBAction func parkingTextFieldDidChange(_ sender: Any) {
        
        guard let amount = parkingTextField.text, !amount.isEmpty else {
            parkingAmount = 0.00
            updateAmounts()
            
            return
        }
        
        parkingAmount = Double(parkingTextField.text!)!
        updateAmounts()
    }
    
    @IBAction func sublettingTextFieldDidChange(_ sender: Any) {
        
        guard let amount = sublettingTextField.text, !amount.isEmpty else {
            sublettingAmount = 0.00
            updateAmounts()
            return
        }
        sublettingAmount = Double(sublettingTextField.text!)!
        
        updateAmounts()
    }
    
    @IBAction func parkSubleasedDidChange(_ sender: Any) {
        if parkingSubleasedSwitch.isOn {
            parkingSubleased = 0
        } else {
            parkingSubleased = 1
        }
        
        updateAmounts()
    }
    
    @IBAction func numberOfPeopleSliderDidChange(_ sender: Any) {
        numberOfPeople = Int(numberOfPeopleSlider.value)
        numberOfPeopleLabel.text =  "\(numberOfPeople)"
        
        updateAmounts()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // type anywhere to disable keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        baseAmountTextField.layer.borderWidth = 2
        baseAmountTextField.layer.borderColor = UIColor(red: 255/255, green: 189/255, blue: 189/255, alpha: 1/1).cgColor
        baseAmountTextField.layer.cornerRadius = 5
        
        utilitiesTextField.layer.borderWidth = 2
        utilitiesTextField.layer.borderColor = UIColor(red: 255/255, green: 189/255, blue: 189/255, alpha: 1/1).cgColor
        utilitiesTextField.layer.cornerRadius = 5
        
        parkingTextField.layer.borderWidth = 2
        parkingTextField.layer.borderColor = UIColor(red: 255/255, green: 189/255, blue: 189/255, alpha: 1/1).cgColor
        parkingTextField.layer.cornerRadius = 5
        
        sublettingTextField.layer.borderWidth = 2
        sublettingTextField.layer.borderColor = UIColor(red: 255/255, green: 189/255, blue: 189/255, alpha: 1/1).cgColor
        sublettingTextField.layer.cornerRadius = 5
        
        numberOfPeopleLabel.layer.borderWidth = 2
        numberOfPeopleLabel.layer.borderColor = UIColor(red: 255/255, green: 189/255, blue: 189/255, alpha: 1/1).cgColor
        numberOfPeopleLabel.layer.cornerRadius = 5
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateAmounts() {
        totalAmount = baseAmount + utitiliesAmount + parkingAmount*Double(parkingSubleased) - sublettingAmount
        totalAmountPerPerson = totalAmount/Double(numberOfPeople)
        
        totalAmountTextField.text = "$" + String(format: "%.2f", totalAmount)
        
        totalPerPersonTextField.text = "$" + String(format: "%.2f", totalAmountPerPerson)
    }
}
