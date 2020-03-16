//
//  SelectViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var textArray: NSMutableArray! = NSMutableArray()
    var numBuddies = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = self.textArray.object(at: 0) as? String
        dump(textArray)
        numBuddies = self.textArray.count - 1
        print(numBuddies)
        // Do any additional setup after loading the view.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
