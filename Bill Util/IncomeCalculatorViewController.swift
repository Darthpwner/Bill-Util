//
//  IncomeCalculatorViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/28/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit
import Spring

class IncomeCalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerValue = "Annualy"
    
    var pickerDataSource: [(unit: String, amount: Double)] = [
        ("Hourly", 2080),
        ("Monthly", 12),
        ("Annually", 1)
    ]
    
    @IBOutlet weak var pickerViewContainer: UIView!
    @IBOutlet weak var baseAmountATextField: UITextField!
    @IBOutlet weak var bonusAmountATextField: UITextField!
    @IBOutlet weak var stockAmountATextField: UITextField!
    @IBOutlet weak var baseAmountBTextField: UITextField!
    @IBOutlet weak var bonusAmountBTextField: UITextField!
    @IBOutlet weak var stockAmountBTextField: UITextField!
    
    @IBOutlet weak var numberOfYearsLabel: UILabel!
    @IBOutlet weak var companyBButton: UIButton!
    @IBOutlet weak var companyAButton: UIButton!
    @IBOutlet weak var timeButton: UIButton!
    @IBOutlet weak var numberOfYearsSlider: TipViewUISlider!
    
    @IBOutlet weak var totalAmountATextField: UITextField!
    
    @IBOutlet weak var totalAmountBTextField: UITextField!
    @IBOutlet weak var amountsAView: DesignableView!
    
    @IBOutlet weak var amountsBView: DesignableView!
    
    var timePickerView: UIPickerView = UIPickerView()
    
    var baseAmountA = 0.00
    var bonusAmountA = 0.00
    var stockAmountA = 0.00
    var baseAmountB = 0.00
    var bonusAmountB = 0.00
    var stockAmountB = 0.00
    
    var timeAmount = 1.00
    
    var totalAmountA = 0.00
    var totalAmountB = 0.00
    
    var numberOfYears = 1
    
    @IBAction func backButtonDidClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func baseAmountADidChange(_ sender: Any) {
        guard let amount = baseAmountATextField.text, !amount.isEmpty else {
            baseAmountA = 0.00
            updateAmounts()
            return
        }
        
        baseAmountA = Double(baseAmountATextField.text!)!
        updateAmounts()
    }
    
    @IBAction func bonusAmountADidChange(_ sender: Any) {
        guard let amount = bonusAmountATextField.text, !amount.isEmpty else {
            bonusAmountA = 0.00
            updateAmounts()
            return
        }
        
        bonusAmountA = Double(bonusAmountATextField.text!)!
        updateAmounts()
    }
    
    @IBAction func stockAmountADidChange(_ sender: Any) {
        guard let amount = stockAmountATextField.text, !amount.isEmpty else {
            stockAmountA = 0.00
            updateAmounts()
            return
        }
        
        stockAmountA = Double(stockAmountATextField.text!)!
        updateAmounts()
    }
    
    @IBAction func baseAmountBDidChange(_ sender: Any) {
        guard let amount = baseAmountBTextField.text, !amount.isEmpty else {
            baseAmountB = 0.00
            updateAmounts()
            return
        }
        
        baseAmountB = Double(baseAmountBTextField.text!)!
        updateAmounts()
    }
    
    @IBAction func bonusAmountBDidChange(_ sender: Any) {
        guard let amount = bonusAmountBTextField.text, !amount.isEmpty else {
            bonusAmountB = 0.00
            updateAmounts()
            return
        }
        
        bonusAmountB = Double(bonusAmountBTextField.text!)!
        updateAmounts()
    }
    
    @IBAction func stockAmountBDidChange(_ sender: Any) {
        guard let amount = stockAmountBTextField.text, !amount.isEmpty else {
            stockAmountB = 0.00
            updateAmounts()
            return
        }
        
        stockAmountB = Double(stockAmountBTextField.text!)!
        updateAmounts()
    }
    
    @IBAction func numberOfYearsSliderDidChange(_ sender: Any) {
        
        numberOfYears = Int(numberOfYearsSlider.value)
        numberOfYearsLabel.text = "\(numberOfYears)"
        
        updateAmounts()
    }
    
    
    
    @IBAction func timeButtonDidClick(_ sender: Any) {
        pickerViewContainer.isHidden = false
    }
    
    @IBAction func companyBButtonDidClick(_ sender: Any) {
    
        // company view switching animations setups
        amountsAView.animation = "fadeInLeft"
        amountsAView.curve = "spring"
        amountsAView.force = 1
        amountsAView.duration = 0.5
        
        amountsBView.animation = "fadeInLeft"
        amountsBView.curve = "spring"
        amountsBView.force = 1
        amountsBView.duration = 0.5
        
        if (companyBButton.isSelected)
        {
            amountsBView.isHidden = true
            amountsAView.isHidden = false
            
            amountsAView.animate()
            
            companyBButton.isSelected = false
            companyBButton.setImage(UIImage(named: "company-b"), for: .normal)
            companyAButton.isSelected = true
            companyAButton.setImage(UIImage(named: "company-a-fill"), for: .selected)
        }
        else
        {
            amountsBView.isHidden = false
            amountsAView.isHidden = true
            
            amountsBView.animate()
            companyBButton.isSelected = true
            companyBButton.setImage(UIImage(named: "company-b-fill"), for: .selected)
            companyAButton.isSelected = false
            companyAButton.setImage(UIImage(named: "company-a"), for: .normal)
        }
    }
    
    @IBAction func companyAButtonDidClick(_ sender: Any) {
        
        // company view switching animations setups
        amountsAView.animation = "fadeInLeft"
        amountsAView.curve = "spring"
        amountsAView.force = 1
        amountsAView.duration = 0.5
        
        amountsBView.animation = "fadeInLeft"
        amountsBView.curve = "spring"
        amountsBView.force = 1
        amountsBView.duration = 0.5
        
        if (companyAButton.isSelected)
        {
            amountsBView.isHidden = false
            amountsAView.isHidden = true
            
            amountsBView.animate()
            companyBButton.isSelected = true
            companyBButton.setImage(UIImage(named: "company-b-fill"), for: .selected)
            companyAButton.isSelected = false
            companyAButton.setImage(UIImage(named: "company-a"), for: .normal)
        }
        else
        {
            amountsBView.isHidden = true
            amountsAView.isHidden = false
            
            amountsAView.animate()
            companyBButton.isSelected = false
            companyBButton.setImage(UIImage(named: "company-b"), for: .normal)
            companyAButton.isSelected = true
            companyAButton.setImage(UIImage(named: "company-a-fill"), for: .selected)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide company B page initially
        amountsBView.isHidden = true
        
        // type anywhere to disable keyboard
        self.hideKeyboardWhenTappedAround()
        
        // Do any additional setup after loading the view.
        baseAmountATextField.layer.borderWidth = 2
        baseAmountATextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        baseAmountATextField.layer.cornerRadius = 5
        
        bonusAmountATextField.layer.borderWidth = 2
        bonusAmountATextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        bonusAmountATextField.layer.cornerRadius = 5
        
        stockAmountATextField.layer.borderWidth = 2
        stockAmountATextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        stockAmountATextField.layer.cornerRadius = 5
        
        baseAmountBTextField.layer.borderWidth = 2
        baseAmountBTextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        baseAmountBTextField.layer.cornerRadius = 5
        
        bonusAmountBTextField.layer.borderWidth = 2
        bonusAmountBTextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        bonusAmountBTextField.layer.cornerRadius = 5
        
        stockAmountBTextField.layer.borderWidth = 2
        stockAmountBTextField.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        stockAmountBTextField.layer.cornerRadius = 5
        
        numberOfYearsLabel.layer.borderWidth = 2
        numberOfYearsLabel.layer.borderColor = UIColor(red: 184/255, green: 184/255, blue: 253/255, alpha: 1/1).cgColor
        numberOfYearsLabel.layer.cornerRadius = 5
        
        pickerViewHandler()
        pickerViewContainer.isHidden = true
        
        // set default picker value
        timePickerView.selectRow(2, inComponent: 0, animated: false)
        
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
        timeButton.setTitle(pickerValue, for: .normal)
        
        timeAmount = pickerDataSource[row].amount
        
        updateAmounts()
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 35
    }
    
    func updateAmounts() {
        totalAmountA = (baseAmountA*timeAmount + bonusAmountA + stockAmountA)*Double(numberOfYears)
        totalAmountB = (baseAmountB*timeAmount + bonusAmountB + stockAmountB)*Double(numberOfYears)
        
        totalAmountATextField.text = "$" + String(format: "%.2f", totalAmountA)
        totalAmountBTextField.text = "$" + String(format: "%.2f", totalAmountB)
//
    }
}
