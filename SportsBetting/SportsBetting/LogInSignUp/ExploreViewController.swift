//
//  ExploreViewController.swift
//  SportsBetting
//
//  Created by Deval Parikh on 6/14/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.

//Needs fixing

import UIKit

class ExploreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var WorldCupMatches = [WorldCupElement]()
    
    @IBOutlet weak var WorldCupTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJSON {
            self.WorldCupTableView.reloadData()
        }
        
        WorldCupTableView.delegate = self
        WorldCupTableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return WorldCupMatches.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WorldCupCell") as? WorldCupCell else { return UITableViewCell() }
        
        cell.TeamLabel.text = WorldCupMatches[indexPath.row].homeTeam.country + " vs. " + WorldCupMatches[indexPath.row].awayTeam.country
        
        return cell
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "http://worldcup.sfg.io/matches")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.WorldCupMatches = try JSONDecoder().decode([WorldCupElement].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                } catch {
                    print("JSON Error")
                }
            }
        }.resume()
    }
}
