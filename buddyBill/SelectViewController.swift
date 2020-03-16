//
//  SelectViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/15/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class SelectViewController: UIViewController, SelectCellDelegate, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!

    var itemArray = ["hamburger", "pizza","salad"]
    var priceArray = [8, 4.50, 3]
    
    var textArray: NSMutableArray! = NSMutableArray()
    
    var numBuddies = 0
    
    //var foodPersonDict: NSDictionary = [String:NSMutableArray()]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        nameLabel.text = self.textArray.object(at: 0) as? String
        //dump(textArray)
        numBuddies = numBuddies + 1
        //print(numBuddies)
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onDoneButton(_ sender: Any) {
        if numBuddies == self.textArray.count {
            
            self.performSegue(withIdentifier: "resultsSegue", sender: nil)
            
            
        }
        else{
            nameLabel.text = self.textArray.object(at: numBuddies) as? String
            numBuddies = numBuddies + 1
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //print(itemArray.count)
        return itemArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = UITableViewCell()
        //cell.textLabel!.text = "row: \(indexPath.row)"
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectCell", for: indexPath) as! SelectCell
        //cell.itemLabel.text = "hi"
        //7. delegate view controller instance to the cell
        cell.delegate = self as? SelectCellDelegate
        cell.itemLabel.text = self.itemArray[indexPath.row]
        cell.priceLabel.text = String(self.priceArray[indexPath.row])
        
        return cell
    }
    
    func onMineButton(cell: SelectCell) {
        //Get the indexpath of cell where button was tapped
        let indexPath = self.tableView.indexPath(for: cell)
        //print(indexPath!.row)
        //print(cell.itemLabel.text!) // hamburger
        //print(cell.priceLabel.text!) // price
        //print(nameLabel.text as Any) // person name
        //foodPersonDict[cell.itemLabel.text!]! += [String(nameLabel.text!)]
        //foodPriceDict[cell.itemLabel.text!] = (cell.priceLabel.text! as NSString).doubleValue
        
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.destination is ResultsViewController
        {
            //let vc = segue.destination as? ResultsViewController
            //vc?.textArray = textArray
        }
    }
    

}
