//
//  ViewController.swift
//  InClass04AdvMad
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var EmailField: UITextField!
    
    
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var DepartmentField: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if(nameField.text == ""){
            let alert = UIAlertController(title: "Invalid Name", message: "Name Field should not be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false;
            
        }else  if(EmailField.text == "" || !(EmailField.text?.range(of: "@") != nil ) || !(EmailField.text?.range(of: ".") != nil )){
            let alert = UIAlertController(title: "Invalid Email", message: "Email Field should not be empty and should contain @ .", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return false;
        }
        else if(PasswordField.text == ""){
            let alert = UIAlertController(title: "Invalid Password", message: "Password Field should not be empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false;
            
            
        }
        
        return true
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueHome" {
            
            if let profileAct = segue.destination as? ProfileViewController{
                
                    
                    var des : String?;
                    switch DepartmentField.selectedSegmentIndex{
                        
                    case 0:
                        des = "CS"
                    case 1:
                        des = "SIS"
                    case 2:
                        des = "BIO"
                        
                    default:
                        print("Invalid")
                    }
                        
                    let usObj = User(name: nameField.text, email: EmailField.text, password:  PasswordField.text, dept: des)
                      
                    profileAct.userObj = usObj
                    
                    
                    
                    //profileAct.deptStr =
                
                
            }
        }
        
        
        
    }
    
    
    
    
    


}

