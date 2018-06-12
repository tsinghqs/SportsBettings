//
//  ViewController.swift
//  SportsBetting
//
//  Created by Tarun Singh on 6/9/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var oddsText: UITextField!
    @IBOutlet weak var amountText: UITextField!
    var plusminus = true
    var payout = 0
    @IBAction func indexChanged(_ sender: AnyObject) {
        switch sender.selectedSegmentIndex
        {
        case 0:
           plusminus = true
        case 1:
            plusminus = false
        default:
            plusminus = true
        }
    }
    
    @IBOutlet weak var payoutText: UILabel!
    @IBAction func Calculate(_ sender: AnyObject) {
         var odds  = Int(oddsText.text!)
         var amount = Int(amountText.text!)
        
        if plusminus {
            payout = (amount!/odds!) * 100 + amount!
            payoutText.text = String(payout)
        }
        else {
            payout = (amount!/100) * odds!  + amount!
            payoutText.text = String(payout)
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

