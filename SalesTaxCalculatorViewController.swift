//
//  SalesTaxCalculatorViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/21/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class SalesTaxCalculatorViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
            
        } else if(row == 1) {
            
        } else if(row == 2) {
            
        } else if(row == 3) {
            
        } else if(row == 4) {
            
        } else if(row == 5) {
            
        } else if(row == 6) {
            
        } else if(row == 7) {
            
        }else if(row == 8) {
            
        }else if(row == 9) {
            
        }else if(row == 10) {
            
        }else if(row == 11) {
            
        }else if(row == 12) {
            
        }else if(row == 13) {
            
        }else if(row == 14) {
            
        }else if(row == 15) {
            
        }else if(row == 16) {
            
        }else if(row == 17) {
            
        }else if(row == 18) {
            
        }else if(row == 19) {
            
        }else if(row == 20) {
            
        }else if(row == 21) {
            
        }else if(row == 22) {
            
        }else if(row == 23) {
            
        }else if(row == 24) {
            
        }else if(row == 25) {
            
        }else if(row == 26) {
            
        }else if(row == 27) {
            
        }else if(row == 28) {
            
        }else if(row == 29) {
            
        }else if(row == 30) {
            
        }else if(row == 31) {
            
        }else if(row == 32) {
            
        }else if(row == 33) {
            
        }else if(row == 34) {
            
        }else if(row == 35) {
            
        }else if(row == 36) {
            
        }else if(row == 37) {
            
        }else if(row == 38) {
            
        }else if(row == 39) {
            
        }else if(row == 40) {
            
        }else if(row == 41) {
            
        }else if(row == 42) {
            
        }else if(row == 43) {
            
        }else if(row == 44) {
            
        }else if(row == 45) {
            
        }else if(row == 46) {
            
        }else if(row == 47) {
            
        }else if(row == 48) {
            
        }else if(row == 49) {
            
        }else if(row == 50) {
            
        }else if(row == 51) {
            
        }
        
        //Update tipPercentageLabel after we set it
//        tipPercentageLabel.text = "\(Int(tipPercentageProgressView.progress * 100))"
    }
    //

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
