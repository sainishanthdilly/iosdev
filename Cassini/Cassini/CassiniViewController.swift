//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Sai Nishanth Dilly on 10/5/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.splitViewController?.delegate = self
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let url = DemoURL.NASA[segue.identifier ??  ""]{
            
            if let imageVC = segue.destination.contents as? ImageViewController{
                
                imageVC.imageURL = url
                imageVC.title = (sender as? UIButton)?.currentTitle
            }
        }
        
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        
        if primaryViewController.contents == self{
        
            if let iv  = secondaryViewController.contents as? ImageViewController, iv.imageURL == nil{
                return true
            }
            
        }
        
        return false
        
    }
    
    
    
    

}

extension UIViewController{
    
    var contents: UIViewController{
        
        if let nav = self as? UINavigationController{
            return nav.visibleViewController ?? self
        }
        else{
            return self
        }
        
    }
    
}
