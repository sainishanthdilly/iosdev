//
//  ViewController.swift
//  Inclass2b
//
//  Created by Sai Nishanth Dilly on 9/21/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var resul: UILabel!
    @IBOutlet weak var opr2: UITextField!
    
    @IBOutlet weak var opr1: UITextField!
    
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func clearop(_ sender: Any) {
        resul.text = "Result: 0.0"
    }
    
    
    @IBAction func operationDone(_ sender: Any) {
        
        if  Double(opr1.text!) != nil {
            
            if Double(opr2.text!) != nil {
                
                
                switch segment.selectedSegmentIndex{
                    
                case 0:
                    resul.text = "Result: " + String(( Double(opr1.text!)! + Double(opr2.text!)! ))
                case 1:
                    resul.text = "Result: " + String(( Double(opr1.text!)! - Double(opr2.text!)! ))
                case 2:
                    resul.text = "Result: " + String(( Double(opr1.text!)! * Double(opr2.text!)! ))
                case 3:
                    
                    resul.text = "Result: " + String(( Double(opr1.text!)! / Double(opr2.text!)! ))
                    
                default:
                    print("Invalid")
                    
                    
                }
            }
            else{
                print("Invalid Number")
                opr1.text = ""
                opr2.text = ""
                resul.text = "Result: 0.0"
                let alert = UIAlertController(title: "Invalid Number", message: "Enter Valid Input", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
            }
        }
        else{
            print("Invalid Number")
            opr1.text = ""
            opr2.text = ""
            resul.text = "Result: 0.0"
            let alert = UIAlertController(title: "Invalid Number", message: "Enter Valid Input", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
    }
    
}

