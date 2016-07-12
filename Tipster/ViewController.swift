//
//  ViewController.swift
//  Tipster
//
//  Created by Matthew Mitchell on 7/11/16.
//  Copyright © 2016 Matthew Mitchell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var inputNum = 0
//    var inputStringNum = "\(inputNum)"
    var amount: Double = 0.0
    var amountString: String = "0"
    var tipPercentage: Double = 15.0
    var groupSize: Double = 1.0
    
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet var numButtons: [UIButton]!
    
    @IBOutlet weak var percentLabelOne: UILabel!
    @IBOutlet weak var tipAmountLabelOne: UILabel!
    @IBOutlet weak var totalAmountOneLabel: UILabel!
    
    @IBOutlet weak var percentLabelTwo: UILabel!
    @IBOutlet weak var tipAmountTwoLabel: UILabel!
    @IBOutlet weak var totalAmountTwoLabel: UILabel!
    
    @IBOutlet weak var percentLabelThree: UILabel!
    @IBOutlet weak var tipAmountThreeLabel: UILabel!
    @IBOutlet weak var totalAmountThreeLabel: UILabel!
    
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBAction func numButtonsPressed(sender: UIButton) {
        let inputNum: String = sender.titleLabel!.text!
        if inputNum == "C" {
            amount = 0
            amountString = "0"
        }
        else if (inputNum == "0") && (amountString == "0") {
            return
        }
        else if (inputNum == ".") && (amountString.rangeOfString(".") != nil) {
            return
        }
        else if amountString.characters.suffix(3).first! == "." {
            return
        }
        else {
            if (amountString == "0") && (inputNum != ".") {
                amountString = ""
            }
            amountString += inputNum
        }
        print(amountString.characters.suffix(3).first!)
        display(tipPercentage)
}

    
    @IBAction func slidersMoved(sender: UISlider) {
        print(Int(sender.value))
        if sender.tag == 1 {
            tipPercentage = Double(Int(sender.value))
            display(tipPercentage)
        }
        if sender.tag == 2 {
            groupSize = Double(Int(sender.value))
            groupSizeLabel.text = "Group Size: \(Int(groupSize))"
            display(tipPercentage)
        }
    }
    
    func display(tipPercentage: Double) {
        print("-\(amountString)-")
        amount = Double(amountString)!
        print("Amount: Double = \(amount)")
        
        percentLabelOne.text = "\(Int(tipPercentage)-5)%"
        percentLabelTwo.text = "\(Int(tipPercentage))%"
        percentLabelThree.text = "\(Int(tipPercentage)+5)%"
        
        tipAmountLabelOne.text = "\(String(format:"%.2f", (amount/100) * Double(Int(tipPercentage)-5) / groupSize))"
        tipAmountTwoLabel.text = "\(String(format:"%.2f", (amount/100) * Double(Int(tipPercentage)) / groupSize))"
        tipAmountThreeLabel.text = "\(String(format:"%.2f", (amount/100) * Double(Int(tipPercentage)+5) / groupSize))"
        
        totalAmountOneLabel.text = "\(String(format:"%.2f", amount / groupSize + (amount/100) * Double(Int(tipPercentage)-5) / groupSize))"
        totalAmountTwoLabel.text = "\(String(format:"%.2f", amount / groupSize + (amount/100) * Double(Int(tipPercentage)) / groupSize))"
        totalAmountThreeLabel.text = "\(String(format:"%.2f", amount / groupSize + (amount/100) * Double(Int(tipPercentage)+5) / groupSize))"
        
        resultLabel.text = amountString
    }
}

