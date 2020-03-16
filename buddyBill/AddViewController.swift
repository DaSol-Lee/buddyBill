//
//  AddViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/14/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //variables for later segues
    var tax: Float!
    var tip: Float!
    var itemArray: Array<String>!
    var priceArray: Array<Float>!
    

    @IBOutlet weak var addNameField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var textArray: NSMutableArray! = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addNameField.placeholder = "Enter Buddy Name Here! :)"
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    @IBAction func onAddButton(_ sender: Any) {
        
        var input = addNameField.text
        self.textArray.add(input)
        tableView.reloadData()
        addNameField.text = ""
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddBuddyCell", for: indexPath) as! AddBuddyCell
        cell.nameLabel.text = self.textArray.object(at: indexPath.row) as? String
        return cell
    }
    
    
    @IBAction func onDoneButton(_ sender: Any) {
        if textArray.count != 0 {
            self.performSegue(withIdentifier: "selectSegue", sender: nil)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SelectViewController
        {
            let vc = segue.destination as! SelectViewController
            vc.textArray = textArray
            vc.tax = tax
            vc.tip = tip
            vc.itemArray = itemArray
            vc.priceArray = priceArray
        }
    }
    

}
