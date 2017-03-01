//
//  IncomeCalculatorViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/28/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit

class IncomeCalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerValue = "Annualy"
    
    var pickerDataSource: [(unit: String, amount: Double)] = [
        ("Hourly", 2080),
        ("Monthly", 12),
        ("Annually", 1)
    ]
    
    @IBOutlet weak var pickerViewContainer: UIView!
    @IBOutlet weak var baseAmountTextField: UITextField!
    @IBOutlet weak var bonusAmountTextField: UITextField!
    @IBOutlet weak var stockAmountTextField: UITextField!
    @IBOutlet weak var numberOfYearsLabel: UILabel!
    
    var timePickerView: UIPickerView = UIPickerView()
    
    var taxPercent = 0.075
    var numberOfPeople = 1
    var taxAmount = 0.00
    var totalAmount = 0.00
    var billAmount = 0.00
    
    @IBAction func timeButtonDidClick(_ sender: Any) {
        pickerViewContainer.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // type anywhere to disable keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        baseAmountTextField.layer.borderWidth = 2
        baseAmountTextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        baseAmountTextField.layer.cornerRadius = 5
        
        bonusAmountTextField.layer.borderWidth = 2
        bonusAmountTextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        bonusAmountTextField.layer.cornerRadius = 5
        
        stockAmountTextField.layer.borderWidth = 2
        stockAmountTextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        stockAmountTextField.layer.cornerRadius = 5
        
        numberOfYearsLabel.layer.borderWidth = 2
        numberOfYearsLabel.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        numberOfYearsLabel.layer.cornerRadius = 5
        
        pickerViewHandler()
        pickerViewContainer.isHidden = true
        
        self.pickerViewContainer.addSubview(timePickerView)
        self.pickerViewContainer.addSubview(inputToolbar)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var inputToolbar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.barStyle = .default
        toolbar.isTranslucent = true
        toolbar.sizeToFit()
        
        var doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.done, target: self, action: #selector(CurrencyConvertorViewController.inputToolbarDonePressed))
        
        doneButton.tintColor = UIColor.black
        
        if let font = UIFont(name: "AvenirNext-Medium", size: 18) {
            doneButton.setTitleTextAttributes([NSFontAttributeName: font], for: UIControlState.normal)
        }
        
        var spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        
        toolbar.setItems([spaceButton, doneButton], animated: false)
        toolbar.isUserInteractionEnabled = true
        
        return toolbar
    }()
    
    //    func calculateTax(taxPercentage: Int) -> Double {
    //        return (Double(taxPercentage)*totalAmount)/100
    //    }
    
    func inputToolbarDonePressed() {
        pickerViewContainer.isHidden = true
    }
    
    //Custom PickerView methods
    func pickerViewHandler() {
        self.timePickerView.dataSource = self
        self.timePickerView.delegate = self
        
        timePickerView.frame.size.width = UIScreen.main.bounds.width
        timePickerView.frame.size.height = pickerViewContainer.frame.height
        timePickerView.frame.origin.y = inputToolbar.frame.origin.y + inputToolbar.frame.height
        
        self.timePickerView.backgroundColor = UIColor.white
        self.timePickerView.layer.borderColor = UIColor.white.cgColor
        self.timePickerView.layer.borderWidth = 1
        
        timePickerView.selectRow(4, inComponent: 0, animated: false)
    }
    
    //End of custom PickerView methods
    
    //Boilerplate PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        
        let data = pickerDataSource[row].unit
        let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightRegular)])
        label?.font = UIFont(name: "Avenir Next", size: 20)
        label?.attributedText = title
        label?.textAlignment = .center
        return label!
        
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = pickerDataSource[row].unit
        taxPercent = pickerDataSource[row].amount
        taxAmount = billAmount * taxPercent
        totalAmount = billAmount + taxAmount
        
        updateAmounts()
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 35
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
