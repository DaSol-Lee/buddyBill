//
//  AddBuddyCell.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class AddBuddyCell: UITableViewCell {
    
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    public func configure(text: String?, placeholder: String) {
        textField.text = text
        textField.placeholder = placeholder

        textField.accessibilityValue = text
        textField.accessibilityLabel = placeholder
    }
    
    //override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    //}

}
