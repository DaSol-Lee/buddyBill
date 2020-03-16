//
//  AddViewController.swift
//  buddyBill
//
//  Created by Da Sol Lee on 3/14/20.
//  Copyright © 2020 dasol. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var countField: UITextField!
    
    var textArray: NSMutableArray! = NSMutableArray()
    
    @IBOutlet weak var tableView: UITableView!
    

    @IBAction func sendMessageButton(_ sender: Any) {
        
        var input = countField.text


        //make rows change their dimensions
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 44.0

        self.textArray.add(input)
        tableView.reloadData()
        countField.text = ""
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countField.placeholder = "Enter Buddy Name Here! :) "
        var input = countField.text
        self.tableView.rowHeight = UITableView.automaticDimension

        self.tableView.estimatedRowHeight = 44.0
        
        tableView.dataSource = self
        tableView.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddBuddyCell", for: indexPath) as! AddBuddyCell

        //cell.configure(text: "", placeholder: "Enter some text!")
        cell.textField.delegate = self as? UITextFieldDelegate
        cell.textField.text = self.textArray.object(at: indexPath.row) as? String
    
        return cell
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
