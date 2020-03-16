//
//  SelectViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //variables for other segues
    var tax: Float!
    var tip: Float!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var itemArray: Array<String>!
    var priceArray: Array<Float>!
    var nameArray: NSMutableArray! = NSMutableArray()
    
    var itemOwnersDict = [String: Set<String>]()
    var itemPricesDict = [String:Float]()
    
    var numBuddies = 0
        
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsMultipleSelection = true
        
        for (index, item) in itemArray.enumerated() {
            itemPricesDict[item]=priceArray[index]
        }
        
        nameLabel.text = self.nameArray.object(at: 0) as? String
        numBuddies = numBuddies + 1
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        
        let selectedIndexPaths = tableView.indexPathsForSelectedRows
        
        if (selectedIndexPaths != nil){
            for indexPath in selectedIndexPaths! {
                let item = itemArray![indexPath.row]
                if itemOwnersDict.keys.contains(item) {
                    itemOwnersDict[item]!.insert(nameLabel.text!)
                } else {
                    itemOwnersDict[item]=Set([nameLabel.text!])
                }
            }
            //print(itemOwnersDict)
            
            if numBuddies == self.nameArray.count {
                self.performSegue(withIdentifier: "calculateBillSegue", sender: nil)
            }
            else{
                tableView.reloadData()
                nameLabel.text = self.nameArray.object(at: numBuddies) as? String
                numBuddies = numBuddies + 1
            }
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell", for: indexPath) as! SelectCell
        cell.itemLabel.text = self.itemArray[indexPath.row]
        cell.priceLabel.text = String(self.priceArray[indexPath.row])
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 210/255, green: 181/255, blue: 156/255, alpha: 0.3)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let calculateBillViewController = segue.destination as! CalculateBillViewController
        calculateBillViewController.tax = tax
        calculateBillViewController.tip = tip
        calculateBillViewController.itemOwnersDict = itemOwnersDict
        calculateBillViewController.itemPricesDict = itemPricesDict
    }
    

}
