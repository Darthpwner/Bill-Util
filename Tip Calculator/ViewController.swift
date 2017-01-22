//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/14/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource   {
    
    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var numberOfPeopleTextField: UITextField!
    
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var tipPercentageProgressView: UIProgressView!
    @IBOutlet weak var setTipPercentageButton: UIButton!
    
    // Tip percentages
    var pickerDataSource = ["0% (No Tip)", "1%", "2%", "3%", "4%", "5% (Bad)", "6%", "7%", "8%", "9%", "10% (Average)", "11%", "12%", "13%", "14%", "15% (Good)", "16%", "17%", "18%", "19%", "20% (Great)", "21%", "22%", "23%", "24%", "25% (Exceptional)", "26%", "27%", "28%", "29%", "30%", "31%", "32%", "33%", "34%", "35%", "36%", "37%", "38%", "39%", "40%", "41%", "42%", "43%", "44%", "45%", "46%", "47%", "48%", "49%", "50% (Top Notch)", "51%", "52%", "53%", "54%", "55%", "56%", "57%", "58%", "59%", "60%", "61%", "62%", "63%", "64%", "65%", "66%", "67%", "68%", "69%", "70%", "71%", "72%", "73%", "74%", "75%", "76%", "77%", "78%", "79%", "80%", "81%", "82%", "83%", "84%", "85%", "86%", "87%", "88%", "89%", "90%", "91%", "92%", "93%", "94%", "95%", "96%", "97%", "98%", "99%", "100% (Peerless)"]
    
    var tipPickerView: UIPickerView = UIPickerView()
    
    @IBOutlet weak var tipAmountField: UITextField!
    @IBOutlet weak var totalField: UITextField!
    @IBOutlet weak var tipAmountPerPersonField: UITextField!
    @IBOutlet weak var totalPerPersonField: UITextField!

    @IBOutlet weak var calculateButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))

        view.addGestureRecognizer(tap)
        
        //PickerView
        pickerViewHandler()
        self.view.addSubview(tipPickerView)
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
    
    //Custom PickerView methods
    func pickerViewHandler () {
        self.tipPickerView.isHidden = true
        self.tipPickerView.dataSource = self
        self.tipPickerView.delegate = self
        
        print(UIScreen.main.bounds.height)
        self.tipPickerView.frame = CGRect(x: 0, y: UIScreen.main.bounds.height - (UIScreen.main.bounds.height / 4), width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 4)
        self.tipPickerView.backgroundColor = UIColor.white
        self.tipPickerView.layer.borderColor = UIColor.white.cgColor
        self.tipPickerView.layer.borderWidth = 1
    }
    //End of custom PickerView methods
    
    //Boilerplate PickerView Methods
    func numberOfComponents(in: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    //Updates the action when changing the Picker View
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 0) {
            tipPercentageProgressView.progress = 0.00
        } else if(row == 1) {
            tipPercentageProgressView.progress = 0.01
        } else if(row == 2) {
           tipPercentageProgressView.progress = 0.02
        } else if(row == 3) {
            tipPercentageProgressView.progress = 0.03
        } else if(row == 4) {
            tipPercentageProgressView.progress = 0.04
        } else if(row == 5) {
            tipPercentageProgressView.progress = 0.05
        } else if(row == 6) {
            tipPercentageProgressView.progress = 0.06
        } else if(row == 7) {
            tipPercentageProgressView.progress = 0.07
        }else if(row == 8) {
            tipPercentageProgressView.progress = 0.08
        }else if(row == 9) {
            tipPercentageProgressView.progress = 0.09
        }else if(row == 10) {
            tipPercentageProgressView.progress = 0.10
        }else if(row == 11) {
            tipPercentageProgressView.progress = 0.11
        }else if(row == 12) {
            tipPercentageProgressView.progress = 0.12
        }else if(row == 13) {
            tipPercentageProgressView.progress = 0.13
        }else if(row == 14) {
            tipPercentageProgressView.progress = 0.14
        }else if(row == 15) {
            tipPercentageProgressView.progress = 0.15
        }else if(row == 16) {
            tipPercentageProgressView.progress = 0.16
        }else if(row == 17) {
            tipPercentageProgressView.progress = 0.17
        }else if(row == 18) {
            tipPercentageProgressView.progress = 0.18
        }else if(row == 19) {
            tipPercentageProgressView.progress = 0.19
        }else if(row == 20) {
            tipPercentageProgressView.progress = 0.20
        }else if(row == 21) {
            tipPercentageProgressView.progress = 0.21
        }else if(row == 22) {
            tipPercentageProgressView.progress = 0.22
        }else if(row == 23) {
            tipPercentageProgressView.progress = 0.23
        }else if(row == 24) {
            tipPercentageProgressView.progress = 0.24
        }else if(row == 25) {
            tipPercentageProgressView.progress = 0.25
        }else if(row == 26) {
            tipPercentageProgressView.progress = 0.26
        }else if(row == 27) {
            tipPercentageProgressView.progress = 0.27
        }else if(row == 28) {
            tipPercentageProgressView.progress = 0.28
        }else if(row == 29) {
            tipPercentageProgressView.progress = 0.29
        }else if(row == 30) {
            tipPercentageProgressView.progress = 0.30
        }else if(row == 31) {
            tipPercentageProgressView.progress = 0.31
        }else if(row == 32) {
            tipPercentageProgressView.progress = 0.32
        }else if(row == 33) {
            tipPercentageProgressView.progress = 0.33
        }else if(row == 34) {
            tipPercentageProgressView.progress = 0.34
        }else if(row == 35) {
            tipPercentageProgressView.progress = 0.35
        }else if(row == 36) {
            tipPercentageProgressView.progress = 0.36
        }else if(row == 37) {
            tipPercentageProgressView.progress = 0.37
        }else if(row == 38) {
            tipPercentageProgressView.progress = 0.38
        }else if(row == 39) {
            tipPercentageProgressView.progress = 0.39
        }else if(row == 40) {
            tipPercentageProgressView.progress = 0.40
        }else if(row == 41) {
            tipPercentageProgressView.progress = 0.41
        }else if(row == 42) {
            tipPercentageProgressView.progress = 0.42
        }else if(row == 43) {
            tipPercentageProgressView.progress = 0.43
        }else if(row == 44) {
            tipPercentageProgressView.progress = 0.44
        }else if(row == 45) {
            tipPercentageProgressView.progress = 0.45
        }else if(row == 46) {
            tipPercentageProgressView.progress = 0.46
        }else if(row == 47) {
            tipPercentageProgressView.progress = 0.47
        }else if(row == 48) {
            tipPercentageProgressView.progress = 0.48
        }else if(row == 49) {
            tipPercentageProgressView.progress = 0.49
        }else if(row == 50) {
            tipPercentageProgressView.progress = 0.50
        }else if(row == 51) {
            tipPercentageProgressView.progress = 0.51
        }else if(row == 52) {
            tipPercentageProgressView.progress = 0.52
        }else if(row == 53) {
            tipPercentageProgressView.progress = 0.53
        }else if(row == 54) {
            tipPercentageProgressView.progress = 0.54
        }else if(row == 55) {
            tipPercentageProgressView.progress = 0.55
        }else if(row == 56) {
            tipPercentageProgressView.progress = 0.56
        }else if(row == 57) {
            tipPercentageProgressView.progress = 0.57
        }else if(row == 58) {
            tipPercentageProgressView.progress = 0.58
        }else if(row == 59) {
            tipPercentageProgressView.progress = 0.59
        }else if(row == 60) {
            tipPercentageProgressView.progress = 0.60
        }else if(row == 61) {
            tipPercentageProgressView.progress = 0.61
        }else if(row == 62) {
            tipPercentageProgressView.progress = 0.62
        }else if(row == 63) {
            tipPercentageProgressView.progress = 0.63
        }else if(row == 64) {
            tipPercentageProgressView.progress = 0.64
        }else if(row == 65) {
            tipPercentageProgressView.progress = 0.65
        }else if(row == 66) {
            tipPercentageProgressView.progress = 0.66
        }else if(row == 67) {
            tipPercentageProgressView.progress = 0.67
        }else if(row == 68) {
            tipPercentageProgressView.progress = 0.68
        }else if(row == 69) {
            tipPercentageProgressView.progress = 0.69
        }else if(row == 70) {
            tipPercentageProgressView.progress = 0.70
        }else if(row == 71) {
            tipPercentageProgressView.progress = 0.71
        }else if(row == 72) {
            tipPercentageProgressView.progress = 0.72
        }else if(row == 73) {
            tipPercentageProgressView.progress = 0.73
        }else if(row == 74) {
            tipPercentageProgressView.progress = 0.74
        }else if(row == 75) {
            tipPercentageProgressView.progress = 0.75
        }else if(row == 76) {
            tipPercentageProgressView.progress = 0.76
        }else if(row == 77) {
            tipPercentageProgressView.progress = 0.77
        }else if(row == 78) {
            tipPercentageProgressView.progress = 0.78
        }else if(row == 79) {
            tipPercentageProgressView.progress = 0.79
        }else if(row == 80) {
            tipPercentageProgressView.progress = 0.80
        }else if(row == 81) {
            tipPercentageProgressView.progress = 0.81
        }else if(row == 82) {
            tipPercentageProgressView.progress = 0.82
        }else if(row == 83) {
            tipPercentageProgressView.progress = 0.83
        }else if(row == 84) {
            tipPercentageProgressView.progress = 0.84
        }else if(row == 85) {
            tipPercentageProgressView.progress = 0.85
        }else if(row == 86) {
            tipPercentageProgressView.progress = 0.86
        }else if(row == 87) {
            tipPercentageProgressView.progress = 0.87
        }else if(row == 88) {
            tipPercentageProgressView.progress = 0.88
        }else if(row == 89) {
            tipPercentageProgressView.progress = 0.89
        }else if(row == 90) {
            tipPercentageProgressView.progress = 0.90
        }else if(row == 91) {
            tipPercentageProgressView.progress = 0.91
        }else if(row == 92) {
            tipPercentageProgressView.progress = 0.92
        }else if(row == 93) {
            tipPercentageProgressView.progress = 0.93
        }else if(row == 94) {
            tipPercentageProgressView.progress = 0.94
        }else if(row == 95) {
            tipPercentageProgressView.progress = 0.95
        }else if(row == 96) {
            tipPercentageProgressView.progress = 0.96
        }else if(row == 97) {
            tipPercentageProgressView.progress = 0.97
        }else if(row == 98) {
            tipPercentageProgressView.progress = 0.98
        }else if(row == 99) {
            tipPercentageProgressView.progress = 0.99
        }else if(row == 100) {
            tipPercentageProgressView.progress = 1.00
        }
        
        //Update tipPercentageLabel after we set it
        tipPercentageLabel.text = "\(Int(tipPercentageProgressView.progress * 100))"
    }
    //
    
    @IBAction func setTipPercentage(_ sender: Any) {
        //Show a Picker View here
        if(tipPickerView.isHidden) {
            tipPickerView.isHidden = false
            
            //Prevent selection of text fields
            billAmountField.isUserInteractionEnabled = false
            numberOfPeopleTextField.isUserInteractionEnabled = false
        } else {
            tipPickerView.isHidden = true
            
            //Allow selection of text fields
            billAmountField.isUserInteractionEnabled = true
            numberOfPeopleTextField.isUserInteractionEnabled = true
        }
        
        print("TEST")
    }

    @IBAction func calculateTip(_ sender: Any) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            numberOfPeopleTextField.text = ""
            
//            tipPercentageLabel.text = "0"
//            tipPercentageProgressView.progress = 0
            
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
        
        tipPercentageLabel.text = "\(Int(tipPercentageProgressView.progress * 100))"
        let tipPercentage = Double(tipPercentageProgressView.progress)
        
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
    }

}


