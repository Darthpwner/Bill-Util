//
//  SalesTaxCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/21/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class SalesTaxCalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerValue = "California"

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
    
    var statePickerView: UIPickerView = UIPickerView()

    
    var taxPercent = 0.075
    var numberOfPeople = 1
    var taxAmount = 0.00
    var totalAmount = 0.00
    var billAmount = 0.00
    
    @IBAction func billAmountChanged(_ sender: Any) {
//        billAmount = Double(billAmountTextField.text!)!
//        taxAmount = billAmount * taxPercent
//        totalAmount = billAmount + taxAmount
        
        guard let amount = billAmountTextField.text, !amount.isEmpty else {
            billAmount = 0.00
            taxAmount = billAmount * taxPercent
            totalAmount = billAmount + taxAmount
            
            updateAmounts()
            return
        }
        billAmount = Double(billAmountTextField.text!)!
        taxAmount = billAmount * taxPercent
        totalAmount = billAmount + taxAmount
        
        updateAmounts()
        
    }

    @IBAction func setStateButtonDidClick(_ sender: Any) {
        pickerViewContainer.isHidden = false
        
        updateAmounts()
    }
    
    @IBAction func numberOfPeopleChanged(_ sender: Any) {
        numberOfPeople = Int(numberOfPeopleSlider.value)
        numberOfPeopleLabel.text =  "\(numberOfPeople)"
        
        updateAmounts()
    }
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var taxCostTextField: UITextField!
    @IBOutlet weak var totalAmountTextField: UITextField!
    @IBOutlet weak var totalAmountPerPersonTextField: UITextField!
    @IBOutlet weak var taxCostPerPersonTextField: UITextField!
    @IBOutlet weak var numberOfPeopleSlider: TipViewUISlider!
    @IBOutlet weak var taxPercentageLabel: UILabel!
    @IBOutlet weak var pickerViewContainer: UIView!
    @IBOutlet weak var changeStateButton: UIButton!
    @IBOutlet weak var stateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // type anywhere to disable keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        numberOfPeopleLabel.layer.borderWidth = 2
        numberOfPeopleLabel.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        numberOfPeopleLabel.layer.cornerRadius = 5
        
        changeStateButton.layer.borderWidth = 2
        changeStateButton.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        changeStateButton.layer.cornerRadius = 5

        billAmountTextField.layer.borderWidth = 2
        billAmountTextField.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        billAmountTextField.layer.cornerRadius = 5

        taxPercentageLabel.layer.borderWidth = 2
        taxPercentageLabel.layer.borderColor = UIColor(red: 160/255, green: 210/255, blue: 255/255, alpha: 1/1).cgColor
        taxPercentageLabel.layer.cornerRadius = 5
        
        pickerViewHandler()
        pickerViewContainer.isHidden = true
        
        self.pickerViewContainer.addSubview(statePickerView)
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
        self.statePickerView.dataSource = self
        self.statePickerView.delegate = self
        
        statePickerView.frame.size.width = UIScreen.main.bounds.width
        statePickerView.frame.size.height = pickerViewContainer.frame.height
        statePickerView.frame.origin.y = inputToolbar.frame.origin.y + inputToolbar.frame.height
        
        self.statePickerView.backgroundColor = UIColor.white
        self.statePickerView.layer.borderColor = UIColor.white.cgColor
        self.statePickerView.layer.borderWidth = 1
        
        statePickerView.selectRow(4, inComponent: 0, animated: false)
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
        
        let data = pickerDataSource[row].state
        let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightRegular)])
        label?.font = UIFont(name: "Avenir Next", size: 20)
        label?.attributedText = title
        label?.textAlignment = .center
        return label!
        
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = pickerDataSource[row].state
        taxPercent = pickerDataSource[row].tax
        taxAmount = billAmount * taxPercent
        totalAmount = billAmount + taxAmount
        
        updateAmounts()
        updateLabels(state: pickerValue, tax: pickerDataSource[row].tax)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 35
    }

    
    func updateAmounts() {
        totalAmountTextField.text = "$" + String(format: "%.2f", totalAmount)
        taxCostTextField.text = "$" + String(format: "%.2f", taxAmount)
        
        let totalPerPerson = totalAmount/Double(numberOfPeople)
        let totalPerPersonStr = String(format: "%.2f", totalPerPerson)
        totalAmountPerPersonTextField.text = "$\(totalPerPersonStr)"
        
        let taxPerPercentStr = String(format: "%.2f", taxAmount/Double(numberOfPeople))
        taxCostPerPersonTextField.text = "$\(taxPerPercentStr)"
    }
    
    func updateLabels(state: String, tax: Double) {
        switch state {
        case "Alabama":
            self.stateLabel.text = "AL"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Alaska":
            self.stateLabel.text = "AK"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Arizona":
            self.stateLabel.text = "AZ"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Arkansas":
            self.stateLabel.text = "AR"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "California":
            self.stateLabel.text = "CA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Colorado":
            self.stateLabel.text = "CO"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Connecticut":
            self.stateLabel.text = "CT"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Delaware":
            self.stateLabel.text = "DE"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Florida":
            self.stateLabel.text = "FL"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Georgia":
            self.stateLabel.text = "GA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Hawaii":
            self.stateLabel.text = "HI"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Idaho":
            self.stateLabel.text = "ID"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Illinois":
            self.stateLabel.text = "IL"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Indiana":
            self.stateLabel.text = "IN"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Iowa":
            self.stateLabel.text = "IA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Kansas":
            self.stateLabel.text = "KS"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Kentucky":
            self.stateLabel.text = "KY"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Louisiana":
            self.stateLabel.text = "LA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Maine":
            self.stateLabel.text = "ME"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Maryland":
            self.stateLabel.text = "MD"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Massachusetts":
            self.stateLabel.text = "MA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Michigan":
            self.stateLabel.text = "MI"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Minnesota":
            self.stateLabel.text = "MN"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Mississippi":
            self.stateLabel.text = "MS"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Missouri":
            self.stateLabel.text = "MO"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Montana":
            self.stateLabel.text = "MT"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Nebraska":
            self.stateLabel.text = "NE"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Nevada":
            self.stateLabel.text = "NV"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "New Hampshire":
            self.stateLabel.text = "NH"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "New Jersey":
            self.stateLabel.text = "NJ"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "New Mexico":
            self.stateLabel.text = "NM"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "New York":
            self.stateLabel.text = "NY"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "North Carolina":
            self.stateLabel.text = "NC"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "North Dakota":
            self.stateLabel.text = "ND"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Ohio":
            self.stateLabel.text = "OH"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Oklahoma":
            self.stateLabel.text = "OK"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Oregon":
            self.stateLabel.text = "OR"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Pennsylvania":
            self.stateLabel.text = "PA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Rhode Island":
            self.stateLabel.text = "RI"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "South Carolina":
            self.stateLabel.text = "SC"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "South Dakota":
            self.stateLabel.text = "SD"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Tennessee":
            self.stateLabel.text = "TN"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Texas":
            self.stateLabel.text = "TX"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Utah":
            self.stateLabel.text = "UT"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Vermont":
            self.stateLabel.text = "VT"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Virginia":
            self.stateLabel.text = "VA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Washington":
            self.stateLabel.text = "WA"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "West Virginia":
            self.stateLabel.text = "WV"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Wisconsin":
            self.stateLabel.text = "WI"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "Wyoming":
            self.stateLabel.text = "WY"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        case "D.C.":
            self.stateLabel.text = "DC"
            self.taxPercentageLabel.text = String(format: "%.2f", tax * 100) + "%"
        default:
            self.stateLabel.text = "CA"
            self.taxPercentageLabel.text = String(format: "%.2f", 0.075 * 100) + "%"
        }
    }
}
