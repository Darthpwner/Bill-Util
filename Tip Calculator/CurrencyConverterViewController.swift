//
//  CurrencyConverterViewController.swift
//  Tip Calculator
//
//  Created by Matthew Allen Lin on 1/22/17.
//  Copyright © 2017 Matthew Allen Lin Software. All rights reserved.
//

import UIKit

class CurrencyConverterViewController: UIViewController {

    //LHS
    @IBOutlet weak var currencyPickerView: UIPickerView!
    @IBOutlet weak var queryTextField: UITextField!
    //End of LHS
    
    //RHS
    @IBOutlet weak var usDollarTextField: UITextField!
    @IBOutlet weak var euroTextField: UITextField!
    @IBOutlet weak var yenTextField: UITextField!
    @IBOutlet weak var poundTextField: UITextField!
    @IBOutlet weak var francTextField: UITextField!
    @IBOutlet weak var canadianDollarTextField: UITextField!
    //End of RHS
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
