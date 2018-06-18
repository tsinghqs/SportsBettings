//
//  ViewController.swift
//  WorldCupAPIDebug
//
//  Created by Deval Parikh on 6/17/18.
//  Copyright © 2018 Deval Parikh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var WorldCupTableView: UITableView!
    
    var WorldCupArray = [Json4Swift_Base]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            print("JSON DOWNLOADED")
        }
    }

    func downloadJSON(completed: @escaping () -> ()) {
        
        
        let url = URL(string: "http://worldcup.sfg.io/matches")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error == nil {
                
                do {
                    
                    let worldCup = try JSONDecoder().decode([Json4Swift_Base].self, from: data!)
                    
                    //self.WorldCupArray = worldCup
                    
                    //print(self.WorldCupArray[0].away_team?.country)
                    
                    DispatchQueue.main.async {
                        
                        completed()
                        
                    }
                    
                } catch {
                    
                    print("JSON Fetching Error")
                    
                }
            }
        }.resume()
    }
}

