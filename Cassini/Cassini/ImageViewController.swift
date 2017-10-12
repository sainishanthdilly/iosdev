//
//  ImageViewController.swift
//  Cassini
//
//  Created by Sai Nishanth Dilly on 10/4/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController{
    
    
    @IBOutlet weak var activityInd: UIActivityIndicatorView!
    
    var imageURL: URL?{
        didSet{
            image = nil
            if view.window != nil{
                fetchImage()
            }
        }
    }
    
   
    @IBOutlet weak var scrollvw: UIScrollView!{
        didSet{
            scrollvw.delegate = self
            scrollvw.minimumZoomScale = 0.03
            scrollvw.maximumZoomScale = 3.0
            scrollvw.contentSize = imageView.frame.size
            scrollvw.addSubview(imageView)
        }
    }
    
    private var image : UIImage?{
        get{
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollvw?.contentSize = imageView.frame.size
            activityInd?.stopAnimating()
            
        }
        
    }
    
    fileprivate var imageView : UIImageView = UIImageView()
    
    /*override func viewDidLoad() {
        super.viewDidLoad()
        //view.addSubview(imageView)
        imageURL = DemoURL.stanford
    }
    */
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil{
            fetchImage()
        }
    }
    
    
    private func fetchImage(){
        if let url = imageURL{
            
            activityInd.startAnimating()
            
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
   

}

extension ImageViewController : UIScrollViewDelegate{
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
}






