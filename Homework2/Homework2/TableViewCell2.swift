//
//  TableViewCell2.swift
//  Homework2
//
//  Created by Sai Nishanth Dilly on 10/11/17.
//  Copyright © 2017 Shehab, Mohamed. All rights reserved.
//

import UIKit

class TableViewCell2: UITableViewCell {
    
    
    var imageURL: String?{
        
        didSet{
            imgSquare2.sd_setImage(with: URL(string: imageURL!), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
    }
    
    var imageOptionalURL: String?{
        
        didSet{
            largeImage.sd_setImage(with: URL(string: imageOptionalURL!), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
    }
    
    

    @IBOutlet weak var imgSquare2: UIImageView!
    
    @IBOutlet weak var appTitle2: UILabel!
    
    
    @IBOutlet weak var devName2: UILabel!
    
    @IBOutlet weak var price2: UILabel!
    
    
    @IBOutlet weak var releaseDate2: UILabel!
    
    @IBOutlet weak var largeImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
