//
//  EmailViewController.swift
//  InClass04AdvMad
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class EmailViewController: UIViewController {

    var valueE : String?
    @IBOutlet weak var updateEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateEmail.text = valueE

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if( updateEmail.text == "" || !(updateEmail.text?.range(of: "@") != nil ) || !(updateEmail.text?.range(of: ".") != nil )){
            let alert = UIAlertController(title: "Invalid Email", message: "Email Field should not be empty and should contain @ .", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false;
            
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
