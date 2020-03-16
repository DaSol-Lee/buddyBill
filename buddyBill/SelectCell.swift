//
//  SelectCell.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

//1. delegate method
protocol SelectCellDelegate: AnyObject {
    func onMineButton(cell: SelectCell)
}

class SelectCell: UITableViewCell {

    @IBOutlet weak var mineButton: UIButton!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    //2. create delegate variable
    weak var delegate: SelectCellDelegate?
    
    @IBAction func onMineButton(_ sender: Any) {
        delegate?.onMineButton(cell: self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization cotde
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
