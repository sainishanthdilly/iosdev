//
//  TableViewCell.swift
//  customTableView
//
//  Created by Sai Nishanth Dilly on 10/5/17.
//  Copyright © 2017 Sai Nishanth Dilly. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var textEdit: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
