//
//  Calculator_ViewController.swift
//  SportsBetting
//
//  Created by Soham Dessai on 6/13/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.
//

import UIKit

class Calculator_ViewController: UIViewController {

  
    
    @IBOutlet weak var payoutTextLabel: UILabel!
    
    func convertDoubletoCurrency(amount: Double) ->String{
        let numberformatter = NumberFormatter()
        numberformatter.numberStyle = .currency
        numberformatter.locale = Locale.current
    
        return numberformatter.string(from: NSNumber(value:amount))!
    }
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var amountText: UITextField!
   
    
    @IBOutlet weak var oddsText: UITextField!
    var payout=0.0
    var plusminus = true
    
    @IBAction func plusminusfunc(_ sender: Any) {
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
    
    @IBAction func calculatebox(_ sender: Any) {
        if let odds = Double (oddsText.text!), let amount = Double (amountText.text!) {
            if plusminus {
                payout = (amount/odds) * 100 + amount
                payoutTextLabel.text = "Payout"
                label?.text = convertDoubletoCurrency(amount: payout)
                
            }
            else {
               payoutTextLabel.text = "Payout"
                payout = (amount/100) * odds  + amount
                label?.text = convertDoubletoCurrency(amount: payout)
            }
        }
        else{
            label.text = "false"
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payoutTextLabel.text = ""
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
