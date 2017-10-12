//
//  ViewController.swift
//  Alert
//
//  Created by Sai Nishanth Dilly on 9/27/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
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
    
    
    @IBAction func Alert(_ sender: UIButton) {
        
        let alert1 = UIAlertController(title: "Enter Name Please", message: "NO name", preferredStyle: .alert)
        alert1.addTextField(configurationHandler: { (textF : UITextField) in
            textF.placeholder = "Your name in text field"
        })
        
        alert1.addAction(UIAlertAction(title: "ok", style: .default, handler:{(action:UIAlertAction) in
            print("OK pressed")
            if let text = alert1.textFields?.first {
                
                if text.text == ""{
                    print("nothing entered")
                }
                else{
                    print("enter \(String(describing: text.text))")
                    
                }
            }
            
        }
        
        ))
        
        alert1.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alert1, animated: true, completion: nil)
        
        
    }
    
    @IBAction func ShowShe(_ sender: UIButton) {
        
        let actionsheet = UIAlertController(title: "Action Sheet", message: "Select", preferredStyle: .actionSheet)
        actionsheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: nil))
        actionsheet.addAction(UIAlertAction(title: "Photo", style: .default, handler: nil))
        actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionsheet,animated: true,completion: nil)
        
        
        
    }
    
}

