//
//  ScanViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/14/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class ScanViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func scanButton(_ sender: Any) {
        self.performSegue(withIdentifier: "confirmSegue", sender: nil)
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
