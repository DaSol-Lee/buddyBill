//
//  ItemCell.swift
//  buddyBill
//
//  Created by Greta Yu on 3/14/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    

    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
