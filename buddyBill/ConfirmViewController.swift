//
//  ConfirmViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/14/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var TaxField: UITextField!
    @IBOutlet weak var TipField: UITextField!
    
    var itemArray: Array<String>!
    var priceArray: Array<Float>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        TaxField.placeholder = "0"
        TipField.placeholder = "0"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.itemLabel.text = self.itemArray[indexPath.row]
        cell.priceLabel.text = String(self.priceArray[indexPath.row])
        return cell
    }

    @IBAction func confirmButton(_ sender: Any) {
        self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addViewController = segue.destination as! AddViewController
        addViewController.tax = Float(TaxField.text ?? "0")
        addViewController.tip = Float(TipField.text ?? "0")
        addViewController.itemArray = itemArray
        addViewController.priceArray = priceArray
    }

}
