//
//  ResultsCell.swift
//  buddyBill
//
//  Created by Greta Yu on 3/16/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class ResultsCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var personalBillLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
