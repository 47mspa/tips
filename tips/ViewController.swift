//
//  ViewController.swift
//  tips
//
//  Created by Stephanie Wong on 2016-07-27.
//  Copyright © 2016 Michelle Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var percentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any r esources that can be recreated.
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(sender: AnyObject) {
        setBill()
    }
    
    func setBill() {
        let bill = Double(billField.text!) ?? 0
        let tipPercentages = [0.15, 0.2, 0.25]
        let tip = bill * tipPercentages[percentControl.selectedSegmentIndex]
        let total = bill + tip
        
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        tipLabel.text = formatter.stringFromNumber(tip)
        totalLabel.text = formatter.stringFromNumber(total)
    }
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        let selectedIndex = defaults.integerForKey("default_tip_index") ?? 0
        percentControl.selectedSegmentIndex = selectedIndex;
        
        setBill()
        billField.becomeFirstResponder()
    }
}

