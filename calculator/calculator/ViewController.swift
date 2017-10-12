//
//  ViewController.swift
//  calculator
//
//  Created by Sai Nishanth Dilly on 9/6/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var display: UILabel!
    var userInMiddleOfTyping: Bool = false
    
    
    
    @IBAction func pressedone(_ sender: UIButton) {
        
        let dig = sender.currentTitle!
        let currentval = display.text!
        if userInMiddleOfTyping{
        
        display.text = currentval + dig
        
        
        print("\(dig)  was touched")
        }
        else{
            display.text = dig
            userInMiddleOfTyping = true
        }
        
        
    }
    
    var displayValue : Double{
        get{
           return Double(display!.text!)!
        }
        
        set{
            display.text = String(newValue)
        }
        
    }
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction func operationπ(_ sender: UIButton) {
        
        if userInMiddleOfTyping{
            brain.setOperand(displayValue)
            userInMiddleOfTyping = false
        }
        
        if let mathematicalOperatoion = sender.currentTitle{
            
            brain.performOperation(mathematicalOperatoion)
            
            
        }
        
        if let result = brain.result{
            displayValue = result
            
        }
        
        
        
    }
    
    
}

