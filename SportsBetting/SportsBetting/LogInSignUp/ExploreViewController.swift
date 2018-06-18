//
//  ExploreViewController.swift
//  SportsBetting
//
//  Created by Deval Parikh on 6/14/18.
//  Copyright © 2018 Tarun Singh. All rights reserved.

//Needs fixing

import UIKit

class ExploreViewController: UIViewController{
    
    final let url = URL(string: "http://worldcup.sfg.io/matches")
    
    var LocalWorldCupArray = [WorldCupElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadJson()
    }
    
    func downloadJson() {
        
        guard let downloadURL = url else { return }
        
        URLSession.shared.dataTask(with: downloadURL) { data, urlResponse, error in
            guard let data = data, error == nil, urlResponse != nil else {
                print("Something went wrong with downloading JSON")
                return
            }
            print("downloaded")
            do {
                let decoder = JSONDecoder()
                let DownloadedWorldCupData = try decoder.decode([WorldCupElement].self, from: data)
                self.LocalWorldCupArray = DownloadedWorldCupData
                print(self.LocalWorldCupArray[0].awayTeam.country)
            } catch {
                print("Something went wrong after downloading JSON")
            }
        }.resume()
    }
    
}



