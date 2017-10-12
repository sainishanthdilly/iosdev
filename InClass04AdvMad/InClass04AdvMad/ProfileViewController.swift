//
//  ProfileViewController.swift
//  InClass04AdvMad
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var email: UILabel!
    
    
    @IBOutlet weak var password: UILabel!
    
    
    @IBOutlet weak var dept: UILabel!
    
    
    @IBOutlet weak var sendBut: UIButton!
    
    
    
    var userObj:User = User()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = userObj.nameStr
        email.text = userObj.emailStr
        var str = ""
        for _ in userObj.passStr!.characters{
            str = str+"*"
        }
        password.text = str
        dept.text = userObj.deptStr

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "segueName"{
            
            if let dest = segue.destination as? NameViewController{
                
                dest.valueN = name.text
                
            }
            
        }
        else if segue.identifier == "seguePass"{
            
            if let dest = segue.destination as? PasswordViewController{
                
                dest.valueP = userObj.passStr
                
            }
            
        }
        else if segue.identifier == "segueDept"{
            
            if let dest = segue.destination as? DeptViewController{
                
                dest.valueD = dept.text
                
            }
            
        }
        else if segue.identifier == "segueEmail"{
            
            if let dest = segue.destination as? EmailViewController{
                
                dest.valueE = email.text
                
            }
            
        }
        
        
        
        
    }

    
    @IBAction func showHide(_ sender: UIButton) {
        
        if sender.currentTitle == "Show" {
          
            if let st = userObj.passStr{
            password.text = st
            }
          sender.setTitle("Hide", for: UIControlState.normal )
            
        }
        else{
            var str = ""
            for _ in userObj.passStr!.characters{
                str = str+"*"
            }
            
            password.text = str
           sender.setTitle("Show", for: UIControlState.normal )
        
            
        }
        
        
        
    }
    
    
    
    @IBAction func unwindToThisView(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? NameViewController {
            name.text = sourceViewController.updateName.text
        }
        else if let sourceViewController = sender.source as? PasswordViewController {
            
            password.text = sourceViewController.updatePassword.text
            userObj.passStr = password.text
            sendBut.setTitle("Hide", for: UIControlState.normal)
            
        }
        else if let sourceViewController = sender.source as? DeptViewController {
            switch sourceViewController.updateDept.selectedSegmentIndex{
                
            case 0:
                dept.text = "CS"
            case 1:
                dept.text = "SIS"
            case 2:
                dept.text = "BIO"
                
            default:
                print("Invalid")
                
            }
        }
        else if let sourceViewController = sender.source as? EmailViewController {
            email.text = sourceViewController.updateEmail.text
        }
        
        
        
    }
    
    
    
    
    
    
    
    
 

}
