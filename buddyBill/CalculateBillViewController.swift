//
//  CalculateBillViewController.swift
//  buddyBill
//
//  Created by Greta Yu on 3/16/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class CalculateBillViewController: UIViewController {
    
    var tax: Float!
    var tip: Float!
    var itemOwnersDict: [String: Set<String>]!
    var itemPricesDict: [String:Float]!

    override func viewDidLoad() {
        super.viewDidLoad()

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
