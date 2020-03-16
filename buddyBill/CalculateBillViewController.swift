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
    var personalBillDict = [String:Float]()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        for (item,personSet) in itemOwnersDict{
            for person in  personSet{
                if personalBillDict.keys.contains(person) {
                    personalBillDict[person] = personalBillDict[person]! + (itemPricesDict[item]!/Float(personSet.count))
                } else {
                   personalBillDict[person] = itemPricesDict[item]!/Float(personSet.count)
                }
            }
        }
        if (personalBillDict.isEmpty){
        }
        else{
            if (tax == nil){
                tax = 0
            }
            if (tip == nil){
                tip = 0
            }
            let taxTip = (tax+tip)/Float(personalBillDict.count)
            for (person,price) in personalBillDict{
                personalBillDict[person]! = price + taxTip
            }
            dump(personalBillDict)
        }
        
        
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsViewController = segue.destination as! ResultsViewController
        resultsViewController.personalBillDict = personalBillDict
    }

}
