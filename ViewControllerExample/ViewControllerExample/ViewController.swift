//
//  ViewController.swift
//  ViewControllerExample
//
//  Created by Sai Nishanth Dilly on 9/28/17.
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


    @IBAction func goToSecond(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let second = sb.instantiateViewController(withIdentifier: "secondVC") as? SecondViewController{
            second.infor = "Hello World"
            
            self.present(second, animated: false, completion: nil)
            
        }
        
        
        
        
    }
}

