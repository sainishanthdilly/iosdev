//
//  TableViewCell.swift
//  Homework2
//
//  Created by Sai Nishanth Dilly on 10/7/17.
//  Copyright © 2017 Shehab, Mohamed. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    
    var imageURL: String?{
        
        didSet{
            imgTitle.sd_setImage(with: URL(string: imageURL!), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
    }
    
    
    @IBOutlet weak var imgTitle: UIImageView!
    
    
    @IBOutlet weak var appTitle: UILabel!
    
    @IBOutlet weak var devName: UILabel!
    
    
    @IBOutlet weak var rDate: UILabel!
    
    
    @IBOutlet weak var price: UILabel!
    
  
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
