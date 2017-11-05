//
//  PhotoViewController.swift
//  InClass07
//
//  Created by Sai Nishanth Dilly on 10/26/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase

class PhotoViewController: UIViewController {

    
    var idToDelete : String?
    
    
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var deleteItem: UIBarButtonItem!
    
    func okhandler(aAction : UIAlertAction){
        
        print("deleted")
        Database.database().reference().child("MyImages").child((Auth.auth().currentUser?.uid)!)
        .child(idToDelete!).removeValue()
        Storage.storage().reference().child("images").child("\(idToDelete!).png").delete(completion: nil);
        
        
        
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func delteAction(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Photo Delete", message: "Do you want to delete photo", preferredStyle: UIAlertControllerStyle.alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: self.okhandler)
        let alertCancel = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        alert.addAction(_ : alertAction)
        alert.addAction(_ : alertCancel)
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBOutlet weak var DetailImg: UIImageView!
    
    var stringURL : String?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetailImg.sd_setImage(with: URL(string: stringURL!), placeholderImage: UIImage(named: "placeholder.png"))
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
