//
//  ViewController.swift
//  InClass05
//
//  Created by Sai Nishanth Dilly on 10/5/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var nxt: UIButton!
    
    @IBOutlet weak var prv: UIButton!
    var catg : String = "news"
    
    var index : Int = 0
    
    var total : Int = 0
    
    private var image : UIImage?{
        get{
            return imgSet.image
        }
        set{
            imgSet.image = newValue
            imgSet.sizeToFit()
            animator?.stopAnimating()
            prv.isEnabled = true
            nxt.isEnabled = true
            
        }
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        if image == nil{
            fetchImage()
        }
    }
    
    
    var imageURL: URL?{
        didSet{
            image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
    private func fetchImage(){
        if let url = imageURL{
            
            animator.startAnimating()
            prv.isEnabled = false
            nxt.isEnabled = false
            
            DispatchQueue.global(qos: .userInitiated).async { [weak self] in
                
                
                let contents = try? Data(contentsOf: url)
                
                if let imageData = contents, url == self?.imageURL  {
                    DispatchQueue.main.async {
                        
                        self?.image = UIImage(data: imageData)
                    }
                }
                
                
            }
            
        }
    }
    
    
    @IBOutlet weak var animator: UIActivityIndicatorView!
    
    
    @IBOutlet weak var imgSet: UIImageView!
    
    
    
    @IBAction func prev(_ sender: UIButton) {
        
        if self.index == 0{
            self.index = self.total 
        }
          self.index = self.index - 1;
        imageURL = URL(string : "http://dev.theappsdr.com/lectures/inclass_http/photos.php?category=\(catg)&pid=\(index)")
        print ("http://dev.theappsdr.com/lectures/inclass_http/photos.php?category=\(catg)&pid=\(index)")
        
        
    }
    
    
    @IBAction func cur(_ sender: UIButton) {
        
        if self.index == self.total-1 {
            self.index = -1
        }
        
        
        self.index = self.index + 1;
        imageURL = URL(string : "http://dev.theappsdr.com/lectures/inclass_http/photos.php?category=\(catg)&pid=\(index)")
        print ("http://dev.theappsdr.com/lectures/inclass_http/photos.php?category=\(catg)&pid=\(index)")
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.title = catg
        
        
        
        let urlC = URL(string: "http://dev.theappsdr.com/lectures/inclass_http/photos.php?count=get&category=\(self.catg)")
        
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            
            
            let contents = try? Data(contentsOf: urlC!)
            
            if let countData = contents {
                DispatchQueue.main.async {
                    
                    let total1 = String(data: countData, encoding: String.Encoding.utf8)!
                    
                    self?.total = Int(total1)!
                }
                
            }
            
            
        }

        print ("hi")
        print ("http://dev.theappsdr.com/lectures/inclass_http/photos.php?category=\(catg)&pid=\(index)")
        imageURL = URL(string : "http://dev.theappsdr.com/lectures/inclass_http/photos.php?category=\(catg)&pid=\(index)")
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    
    


}

