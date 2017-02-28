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
    var parkingSubleased: Bool = false
    var totalAmount: Double = 0
    var numberOfPeople: Int = 1
    
    @IBOutlet weak var baseAmountTextField: UITextField!
    @IBOutlet weak var utilitiesTextField: UITextField!
    @IBOutlet weak var parkingTextField: UITextField!
    @IBOutlet weak var sublettingTextField: UITextField!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!

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
//        totalAmountTextField.text = "$" + String(format: "%.2f", totalAmount)
//        taxCostTextField.text = "$" + String(format: "%.2f", taxAmount)
//        
//        let totalPerPerson = totalAmount/Double(numberOfPeople)
//        let totalPerPersonStr = String(format: "%.2f", totalPerPerson)
//        totalAmountPerPersonTextField.text = "$\(totalPerPersonStr)"
//        
//        let taxPerPercentStr = String(format: "%.2f", taxAmount/Double(numberOfPeople))
//        taxCostPerPersonTextField.text = "$\(taxPerPercentStr)"
    }
}
