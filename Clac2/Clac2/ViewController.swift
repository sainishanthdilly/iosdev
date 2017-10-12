//
//  ViewController.swift
//  Clac2
//
//  Created by Sai Nishanth Dilly on 9/21/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var opr1: UITextField!
    
    
    @IBOutlet weak var resul: UILabel!
    @IBOutlet weak var opr2: UITextField!
    
    
    @IBAction func operation(_ sender: UIButton) {
        
        //self.view.makeToast(message: "Simple Toast")
        if  Double(opr1.text!) != nil {
            
            if Double(opr2.text!) != nil {
                
                //opr1.text = sender.currentTitle
                switch sender.currentTitle! {
                case "Add":
                    resul.text = "Result: " + String(( Double(opr1.text!)! + Double(opr2.text!)! ))
                case "Subtract":
                    resul.text = "Result: " + String(( Double(opr1.text!)! - Double(opr2.text!)! ))
                case "Multiply":
                    resul.text = "Result: " + String(( Double(opr1.text!)! * Double(opr2.text!)! ))
                case "Divide":
                    resul.text = "Result: " + String(( Double(opr1.text!)! / Double(opr2.text!)! ))
                    
                case "Clear All":
                    opr1.text = ""
                    opr2.text = ""
                    resul.text = "Result: "
                    
                default:
                    print("no seleced")
                }
            }
            else{
                print("Invalid Number")
                opr1.text = ""
                opr2.text = ""
                resul.text = "Result: "
                let alert = UIAlertController(title: "Invalid Number", message: "Enter Valid Input", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        }
        else{
            
            
            print("Invalid Number")
            opr1.text = ""
            opr2.text = ""
            resul.text = "Result: "
            
            
            let alert = UIAlertController(title: "Invalid Number", message: "Enter Valid Input", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        
        
        
        
    }
    
}

