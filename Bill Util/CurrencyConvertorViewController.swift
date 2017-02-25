//
//  CurrencyConvertorViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/22/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit

class CurrencyConvertorViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    var pickerDataSource = ["US Dollar", "Euro", "Pound", "Yen", "China Yuan", "Canada Dollar", "Mexico Peso"]
    
    var pickerValue = "US Dollar"
    
    var queryAmount: Double = 0
    var usdAmount: Double = 0
    var euroAmount: Double = 0
    var yenAmount: Double = 0
    var poundAmount: Double = 0
    var rmbAmount: Double = 0
    var pesoAmount: Double = 0
    var cadAmount: Double = 0
    
    var currencyPickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var pickerViewContainer: UIView!
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
        pickerViewContainer.isHidden = false
        currencyPickerView.isHidden = false
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
        pickerViewContainer.isHidden = true
        pickerViewHandler()
        
        self.pickerViewContainer.addSubview(currencyPickerView)
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
    
    func inputToolbarDonePressed() {
        pickerViewContainer.isHidden = true
    }
    
    //Custom PickerView methods
    func pickerViewHandler() {
        self.currencyPickerView.dataSource = self
        self.currencyPickerView.delegate = self

        currencyPickerView.frame.size.width = UIScreen.main.bounds.width
        currencyPickerView.frame.size.height = pickerViewContainer.frame.height
        currencyPickerView.frame.origin.y = inputToolbar.frame.origin.y + inputToolbar.frame.height

        self.currencyPickerView.backgroundColor = UIColor.white
        self.currencyPickerView.layer.borderColor = UIColor.white.cgColor
        self.currencyPickerView.layer.borderWidth = 1
    }
    
    //End of custom PickerView methods
    
    //Boilerplate PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return pickerDataSource.count;
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return pickerDataSource[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        var label = view as! UILabel!
        if label == nil {
            label = UILabel()
        }
        
        let data = pickerDataSource[row]
        let title = NSAttributedString(string: data, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 20.0, weight: UIFontWeightRegular)])
        label?.font = UIFont(name: "Avenir Next", size: 20)
        label?.attributedText = title
        label?.textAlignment = .center
        return label!
        
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerValue = pickerDataSource[row]
        updateAmounts(unit: pickerValue)
        updateCurrencyLabel(unit: pickerValue)
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat
    {
        return 35
    }
    
    func updateAmounts(unit: String) {
        
        switch unit {
        case "US Dollar":
            usdAmount = queryAmount
            euroAmount = queryAmount * 0.946890
            yenAmount = queryAmount * 112.144000
            poundAmount = queryAmount * 0.802472
            cadAmount = queryAmount * 1.309250
            pesoAmount = queryAmount * 19.910750
            rmbAmount = queryAmount * 6.867550
        case "Euro":
            usdAmount = queryAmount * 1.056089
            euroAmount = queryAmount
            yenAmount = queryAmount * 118.434031
            poundAmount = queryAmount * 0.847481
            cadAmount = queryAmount * 1.382684
            pesoAmount = queryAmount * 21.027522
            rmbAmount = queryAmount * 7.252743
        case "Yen":
            usdAmount = queryAmount * 0.008917
            euroAmount = queryAmount * 0.008444
            yenAmount = queryAmount
            poundAmount = queryAmount * 0.007156
            cadAmount = queryAmount * 0.011675
            pesoAmount = queryAmount * 0.177546
            rmbAmount = queryAmount * 0.061239
        case "Pound":
            usdAmount = queryAmount * 1.246150
            euroAmount = queryAmount * 1.179967
            yenAmount = queryAmount * 139.748246
            poundAmount = queryAmount
            cadAmount = queryAmount * 1.631522
            pesoAmount = queryAmount * 24.811781
            rmbAmount = queryAmount * 8.557997
        case "China Yuan":
            usdAmount = queryAmount * 0.145612
            euroAmount = queryAmount * 0.137879
            yenAmount = queryAmount * 16.329550
            poundAmount = queryAmount * 0.116850
            cadAmount = queryAmount * 0.190643
            pesoAmount = queryAmount * 2.899251
            rmbAmount = queryAmount
        case "Canada Dollar":
            usdAmount = queryAmount * 0.763796
            euroAmount = queryAmount * 0.723231
            yenAmount = queryAmount * 85.655146
            poundAmount = queryAmount * 0.612925
            cadAmount = queryAmount
            pesoAmount = queryAmount * 15.207753
            rmbAmount = queryAmount * 5.245408
        case "Mexico Peso":
            usdAmount = queryAmount * 0.050224
            euroAmount = queryAmount * 0.047557
            yenAmount = queryAmount * 5.632334
            poundAmount = queryAmount * 0.040303
            cadAmount = queryAmount * 0.065756
            pesoAmount = queryAmount
            rmbAmount = queryAmount * 0.344917
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
    
    func updateCurrencyLabel(unit: String) {
        switch unit {
        case "US Dollar":
            self.currencyUnitLabel.text = "USD"
        case "Euro":
            self.currencyUnitLabel.text = "EUR"
        case "Yen":
            self.currencyUnitLabel.text = "JPY"
        case "Pound":
            self.currencyUnitLabel.text = "GBP"
        case "China Yuan":
            self.currencyUnitLabel.text = "CNY"
        case "Canada Dollar":
            self.currencyUnitLabel.text = "CAD"
        case "Mexico Peso":
            self.currencyUnitLabel.text = "MXN"
        default:
            self.currencyUnitLabel.text = "USD"
        }
    }
}
