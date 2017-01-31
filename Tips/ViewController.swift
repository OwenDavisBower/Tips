//
//  ViewController.swift
//  Tips
//
//  Created by Owen Davis-Bower on 1/4/17.
//  Copyright © 2017 Owen Davis-Bower. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountInput: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var billTotalLabel: UILabel!
    @IBOutlet weak var tipPercentageInput: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var splitAmountInput: UISlider!
    @IBOutlet weak var splitAmountDisplay: UILabel!
    @IBOutlet weak var splitTotalDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Display keyboard immidiately.
        billAmountInput.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Declare variables with default values
    var billAmount:Float = 0;
    var percentageAmount:Int = 15;
    var tipAmount:Float = 0;
    var totalBillAmount:Float = 0;
    var splitAmount:Int = 1;
    var splitTotal:Float = 0;
    
    func updateMain() {
        // Calculate tip
        tipAmount = billAmount * (Float(percentageAmount)/100);
        totalBillAmount = billAmount + tipAmount;
        
        // Update relevant displays
        self.tipAmountLabel.text = "$" + String(format: "%.2f", tipAmount);
        self.billTotalLabel.text = "$" + String(format: "%.2f", totalBillAmount);
        
        //Update the split
        updateSplit()
    }
    
    func updateSplit() {
        // Calculate the split total
        splitTotal = totalBillAmount / Float(splitAmount);
        // Update the relevant displays
        self.splitAmountDisplay.text = String(splitAmount);
        self.splitTotalDisplay.text = "$" + String(format: "%.2f", splitTotal);
    }
    
    // When the bill amount is updated
    @IBAction func billAmountDidChange(_ sender: Any) {
        // Update the bill amount
        billAmount = (billAmountInput.text! as NSString).floatValue;
        // Update the rest of the values & displays
        updateMain()
    }
    
    // When the tip slider is updated
    @IBAction func tipPercentageSliderDidChange(_ sender: Any) {
        // Update the percentage amount
        percentageAmount = Int(tipPercentageInput.value);
        // Update the percentage display
        self.tipPercentageLabel.text = String(percentageAmount) + "%";
        // Update the rest of the values & displays
        updateMain()
    }
    
    // When the split slider is updated
    @IBAction func splitAmountSliderDidChange(_ sender: Any) {
        // Update the split amount
        splitAmount = Int(splitAmountInput.value);
        // Calculate the split total & update the relevant displays
        updateSplit()
    }
    
}

