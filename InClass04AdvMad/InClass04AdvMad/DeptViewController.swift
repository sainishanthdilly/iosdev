//
//  DeptViewController.swift
//  InClass04AdvMad
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class DeptViewController: UIViewController {

    var valueD : String?
    @IBOutlet weak var updateDept: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let x = valueD{
        switch x {
        case "CS":
            updateDept.selectedSegmentIndex = 0
        case "SIS":
            updateDept.selectedSegmentIndex = 1
        case "BIO":
            updateDept.selectedSegmentIndex = 2
        default:
            print("nothin")
            
        }
        }

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

}
