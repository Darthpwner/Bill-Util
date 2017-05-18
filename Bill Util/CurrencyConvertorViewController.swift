//
//  CurrencyConvertorViewController.swift
//  Bill Util
//
//  Created by Kevin Fan on 2/22/17.
//  Copyright © 2017 Kevin Fan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

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
    
    var usd_rates: Dictionary<String, Double> = [
        "usd": 1.0,
        "euro": 0.946890,
        "yen": 112.144000,
        "pound": 0.802472,
        "rmb": 6.867550,
        "peso": 19.910750,
        "cad": 1.309250,
    ]
    
    var euro_rates: Dictionary<String, Double> = [
        "usd": 1.056089,
        "euro": 1.0,
        "yen": 118.434031,
        "pound": 0.847481,
        "rmb": 7.252743,
        "peso": 21.027522,
        "cad": 1.382684,
    ]
    
    var yen_rates: Dictionary<String, Double> = [
        "usd": 0.008917,
        "euro": 0.008444,
        "yen": 1.0,
        "pound": 0.007156,
        "rmb": 0.061239,
        "peso": 0.177546,
        "cad": 0.011675,
    ]
    
    var pound_rates: Dictionary<String, Double> = [
        "usd": 1.246150,
        "euro": 1.179967,
        "yen": 139.748246,
        "pound": 1.0,
        "rmb": 8.557997,
        "peso": 24.811781,
        "cad": 1.631522,
    ]
    
    var rmb_rates: Dictionary<String, Double> = [
        "usd": 0.145612,
        "euro": 0.137879,
        "yen": 16.329550,
        "pound": 0.116850,
        "rmb": 1.0,
        "peso": 2.899251,
        "cad": 0.190643,
    ]
    
    var peso_rates: Dictionary<String, Double> = [
        "usd": 0.050224,
        "euro": 0.047557,
        "yen": 5.632334,
        "pound": 0.040303,
        "rmb": 0.344917,
        "peso": 1.0,
        "cad": 0.065756,
    ]
    
    var cad_rates: Dictionary<String, Double> = [
        "usd": 0.763796,
        "euro": 0.723231,
        "yen": 85.655146,
        "pound": 0.612925,
        "rmb": 5.245408,
        "peso": 15.207753,
        "cad": 1.0,
    ]
    
    
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
    
    @IBAction func backButtonDidClick(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func currencyButtonDidClick(_ sender: Any) {
        pickerViewContainer.isHidden = false
        currencyPickerView.isHidden = false
        //print("button clicked")
    }
    
    @IBAction func moneyAmountDidChange(_ sender: Any) {

        guard let amount = currencyAmountTextField.text, !amount.isEmpty else {
            queryAmount = 0.00
            updateAmounts(unit: pickerValue)
            
            return
        }
        
        queryAmount = Double(currencyAmountTextField.text!)!
        updateAmounts(unit: pickerValue)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        // load curency exchange rates for each currency base
        self.loadCurrencyData(base: "USD")
        self.loadCurrencyData(base: "EUR")
        self.loadCurrencyData(base: "GBP")
        self.loadCurrencyData(base: "CAD")
        self.loadCurrencyData(base: "CNY")
        self.loadCurrencyData(base: "JPY")
        self.loadCurrencyData(base: "MXN")
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
    
    func loadCurrencyData(base: String) {
        Alamofire.request("http://api.fixer.io/latest?base=\(base)&symbols=USD,GBP,EUR,JPY,CNY,CAD,MXN")
            .responseJSON(completionHandler: { (responseData) -> Void in
                if responseData.result.error != nil {
                    print(responseData.result.error!)
                }
                else {
                    let json = JSON(responseData.result.value!)["rates"]

                    switch (base) {
                    case "USD":
                        self.usd_rates["usd"] = 1.0
                        self.usd_rates["euro"] = json["EUR"].doubleValue
                        self.usd_rates["yen"] = json["JPY"].doubleValue
                        self.usd_rates["pound"] = json["GBP"].doubleValue
                        self.usd_rates["cad"] = json["CAD"].doubleValue
                        self.usd_rates["peso"] = json["MXN"].doubleValue
                        self.usd_rates["rmb"] = json["CNY"].doubleValue
                        break
                    case "EUR":
                        self.euro_rates["usd"] = json["USD"].doubleValue
                        self.euro_rates["euro"] = 1.0
                        self.euro_rates["yen"] = json["JPY"].doubleValue
                        self.euro_rates["pound"] = json["GBP"].doubleValue
                        self.euro_rates["cad"] = json["CAD"].doubleValue
                        self.euro_rates["peso"] = json["MXN"].doubleValue
                        self.euro_rates["rmb"] = json["CNY"].doubleValue
                        break
                    case "JPY":
                        self.yen_rates["usd"] = json["USD"].doubleValue
                        self.yen_rates["euro"] = json["EUR"].doubleValue
                        self.yen_rates["yen"] = 1.0
                        self.yen_rates["pound"] = json["GBP"].doubleValue
                        self.yen_rates["cad"] = json["CAD"].doubleValue
                        self.yen_rates["peso"] = json["MXN"].doubleValue
                        self.yen_rates["rmb"] = json["CNY"].doubleValue
                        break
                    case "GBP":
                        self.pound_rates["usd"] = json["USD"].doubleValue
                        self.pound_rates["euro"] = json["EUR"].doubleValue
                        self.pound_rates["yen"] = json["JPY"].doubleValue
                        self.pound_rates["pound"] = 1.0
                        self.pound_rates["cad"] = json["CAD"].doubleValue
                        self.pound_rates["peso"] = json["MXN"].doubleValue
                        self.pound_rates["rmb"] = json["CNY"].doubleValue
                        break
                    case "CNY":
                        self.rmb_rates["usd"] = json["USD"].doubleValue
                        self.rmb_rates["euro"] = json["EUR"].doubleValue
                        self.rmb_rates["yen"] = json["JPY"].doubleValue
                        self.rmb_rates["pound"] = json["GBP"].doubleValue
                        self.rmb_rates["cad"] = json["CAD"].doubleValue
                        self.rmb_rates["peso"] = json["MXN"].doubleValue
                        self.rmb_rates["rmb"] = 1.0
                        break
                    case "CAD":
                        self.cad_rates["usd"] = json["USD"].doubleValue
                        self.cad_rates["euro"] = json["EUR"].doubleValue
                        self.cad_rates["yen"] = json["JPY"].doubleValue
                        self.cad_rates["pound"] = json["GBP"].doubleValue
                        self.cad_rates["cad"] = 1.0
                        self.cad_rates["peso"] = json["MXN"].doubleValue
                        self.cad_rates["rmb"] = json["CNY"].doubleValue
                        break
                    case "MXN":
                        self.peso_rates["usd"] = json["USD"].doubleValue
                        self.peso_rates["euro"] = json["EUR"].doubleValue
                        self.peso_rates["yen"] = json["JPY"].doubleValue
                        self.peso_rates["pound"] = json["GBP"].doubleValue
                        self.peso_rates["cad"] = json["CAD"].doubleValue
                        self.peso_rates["peso"] = 1.0
                        self.peso_rates["rmb"] = json["CNY"].doubleValue
                        break
                    default: break
                    }
                }
        })
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
            usdAmount = queryAmount * usd_rates["usd"]!
            euroAmount = queryAmount * usd_rates["euro"]!
            yenAmount = queryAmount * usd_rates["yen"]!
            poundAmount = queryAmount * usd_rates["pound"]!
            cadAmount = queryAmount * usd_rates["cad"]!
            pesoAmount = queryAmount * usd_rates["peso"]!
            rmbAmount = queryAmount * usd_rates["rmb"]!
        case "Euro":
            usdAmount = queryAmount * euro_rates["usd"]!
            euroAmount = queryAmount * euro_rates["euro"]!
            yenAmount = queryAmount * euro_rates["yen"]!
            poundAmount = queryAmount * euro_rates["pound"]!
            cadAmount = queryAmount * euro_rates["cad"]!
            pesoAmount = queryAmount * euro_rates["peso"]!
            rmbAmount = queryAmount * euro_rates["rmb"]!
        case "Yen":
            usdAmount = queryAmount * yen_rates["usd"]!
            euroAmount = queryAmount * yen_rates["euro"]!
            yenAmount = queryAmount * yen_rates["yen"]!
            poundAmount = queryAmount * yen_rates["pound"]!
            cadAmount = queryAmount * yen_rates["cad"]!
            pesoAmount = queryAmount * yen_rates["peso"]!
            rmbAmount = queryAmount * yen_rates["rmb"]!
        case "Pound":
            usdAmount = queryAmount * pound_rates["usd"]!
            euroAmount = queryAmount * pound_rates["euro"]!
            yenAmount = queryAmount * pound_rates["yen"]!
            poundAmount = queryAmount * pound_rates["pound"]!
            cadAmount = queryAmount * pound_rates["cad"]!
            pesoAmount = queryAmount * pound_rates["peso"]!
            rmbAmount = queryAmount * pound_rates["rmb"]!
        case "China Yuan":
            usdAmount = queryAmount * rmb_rates["usd"]!
            euroAmount = queryAmount * rmb_rates["euro"]!
            yenAmount = queryAmount * rmb_rates["yen"]!
            poundAmount = queryAmount * rmb_rates["pound"]!
            cadAmount = queryAmount * rmb_rates["cad"]!
            pesoAmount = queryAmount * rmb_rates["peso"]!
            rmbAmount = queryAmount * rmb_rates["rmb"]!
        case "Canada Dollar":
            usdAmount = queryAmount * cad_rates["usd"]!
            euroAmount = queryAmount * cad_rates["euro"]!
            yenAmount = queryAmount * cad_rates["yen"]!
            poundAmount = queryAmount * cad_rates["pound"]!
            cadAmount = queryAmount * cad_rates["cad"]!
            pesoAmount = queryAmount * cad_rates["peso"]!
            rmbAmount = queryAmount * cad_rates["rmb"]!
        case "Mexico Peso":
            usdAmount = queryAmount * peso_rates["usd"]!
            euroAmount = queryAmount * peso_rates["euro"]!
            yenAmount = queryAmount * peso_rates["yen"]!
            poundAmount = queryAmount * peso_rates["pound"]!
            cadAmount = queryAmount * peso_rates["cad"]!
            pesoAmount = queryAmount * peso_rates["peso"]!
            rmbAmount = queryAmount * peso_rates["rmb"]!
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
