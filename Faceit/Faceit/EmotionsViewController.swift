//
//  EmotionsViewController.swift
//  Faceit
//
//  Created by Sai Nishanth Dilly on 9/28/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class EmotionsViewController: UIViewController {

    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var destinationViewController = segue.destination
        
        if let navController = destinationViewController as? UINavigationController {
            destinationViewController = navController.visibleViewController ?? destinationViewController
        
        
        if let viewController = destinationViewController as? ViewController{
                print (segue.identifier)
               navController.navigationItem.title = (sender as? UIButton)?.currentTitle
            
        }
        }
        
        
    }
    

}
