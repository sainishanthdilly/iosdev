//
//  SecondViewController.swift
//  ViewControllerExample
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var infor : String? 
        
        

    @IBOutlet weak var info: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        info.text =  infor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func gotoFirst(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }
}
