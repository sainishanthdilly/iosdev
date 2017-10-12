//
//  TableViewCell3.swift
//  Homework2
//
//  Created by Sai Nishanth Dilly on 10/11/17.
//  Copyright © 2017 Shehab, Mohamed. All rights reserved.
//

import UIKit

class TableViewCell3: UITableViewCell {

    
    var imageURL: String?{
        
        didSet{
            imgSquare3.sd_setImage(with: URL(string: imageURL!), placeholderImage: UIImage(named: "placeholder.png"))
            
        }
    }

    
    @IBOutlet weak var imgSquare3: UIImageView!
    
    
    @IBOutlet weak var appTitle3: UILabel!
    
    
    @IBOutlet weak var devName3: UILabel!

    
    @IBOutlet weak var releaseDate3: UILabel!
    
    
    @IBOutlet weak var price3: UILabel!
    
    
    @IBOutlet weak var summary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
