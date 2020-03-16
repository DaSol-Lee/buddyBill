//
//  ResultsViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var personalBillDict: [String:Float]!
    var personalBillNames: Array<String>!

    override func viewDidLoad() {
        super.viewDidLoad()
        personalBillNames = Array(personalBillDict.keys)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personalBillDict.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResultsCell", for: indexPath) as! ResultsCell
        let name = self.personalBillNames[indexPath.row]
        cell.nameLabel.text = name
        cell.personalBillLabel.text = String(self.personalBillDict[name]!)
        return cell
    }
    
    @IBAction func onScanAgain(_ sender: Any) {
        self.performSegue(withIdentifier: "scanSegue", sender: nil)
    }
    
}
