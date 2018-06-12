//
//  ViewController.swift
//  SportsBetting
//
//  Created by Tarun Singh on 6/9/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    var plusminus = true
    var payout = 0.0
   
    @IBAction func indexChanged(_ sender: Any) {
        switch (sender as AnyObject).selectedSegmentIndex
        {
        case 0:
            plusminus = true
        case 1:
            plusminus = false
        default:
            plusminus = true
        }
    }
    
    
    @IBOutlet weak var amountText: UITextField!
    @IBOutlet weak var oddsText: UITextField!
    @IBOutlet weak var payoutText: UILabel!
    
    
    @IBAction func Calculate(_ sender: Any) {
        if let odds = Double (oddsText.text!), let amount = Double (amountText.text!) {
            if plusminus {
                payout = (amount/odds) * 100 + amount
                payoutText?.text = String(payout)
            }
            else {
                payout = (amount/100) * odds  + amount
                payoutText?.text = String(payout)
            }
    }
        else{
            payoutText.text = "false"
        }
        
    }
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

