//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Mohammed Rahman on 12/17/17.
//  Copyright © 2017 Mohammed Rahman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Standard tipping elements
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    
    // Custom tipping elements
    @IBOutlet weak var customTotalLabel: UILabel!
    @IBOutlet weak var customTipField: UITextField!
    
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.15, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        var tip = Double(0)
        var total = Double(0)
        
        tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func customCalculateTip(_ sender: AnyObject) {
        let bill = Double(billField.text!) ?? 0
        let customTipPercentage = Double(customTipField.text!) ?? 0
        let customTip = ((customTipPercentage/100) * bill)
        let customTotal = bill + customTip
        
        customTotalLabel.text = String(format: "$%.2f", customTotal)
    }
}

