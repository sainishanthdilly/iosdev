//
//  LoginViewController.swift
//  InClass07
//
//  Created by Sai Nishanth Dilly on 10/26/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

  
    @IBOutlet weak var loginEmail: UITextField!
    
    
    
    @IBOutlet weak var loginPass: UITextField!
    

    override func viewWillAppear(_ animated: Bool) {
        loginEmail.text = ""
        loginPass.text = ""
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(Auth.auth().currentUser != nil){
            self.performSegue(withIdentifier: "loginDoneSegue", sender: self)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

    @IBOutlet weak var performLogin: UIButton!
    
    @IBAction func loginDon(_ sender: UIButton) {
        
        print("in action")
        if !(loginEmail.text == "" || loginPass.text == ""){
            
            let email = loginEmail.text!
            let password = loginPass.text!
            
            Auth.auth().signIn(withEmail: email, password: password) {[weak self] (user, error) in
                if user != nil{
                    DispatchQueue.main.async {
                        self?.performSegue(withIdentifier: "loginDoneSegue", sender: sender)
                    }
                }
                else{
                    let alert = UIAlertController(title: "Invalid Credentials", message: "Enter Valid Credentials", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self?.present(alert, animated: true, completion: nil)
                    
                }
                
            }
        }
        else{
            let alert = UIAlertController(title: "Invalid Credentials", message: "Email and Password Cannot be blank", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        
        
        
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
 
    
    

}
