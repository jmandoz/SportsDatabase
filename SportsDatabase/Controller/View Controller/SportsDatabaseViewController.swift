//
//  SportsDatabaseViewController.swift
//  SportsDatabase
//
//  Created by Jason Mandozzi on 6/26/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit

class SportsDatabaseViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var playerSearchBar: UISearchBar!
    @IBOutlet weak var playerNameLabel: UILabel!
    @IBOutlet weak var playerSportLabel: UILabel!
    @IBOutlet weak var playerTeamLabel: UILabel!
    @IBOutlet weak var playerNumberLabel: UILabel!
    @IBOutlet weak var playerHeightLabel: UILabel!
    @IBOutlet weak var playerWeightLabel: UILabel!
    @IBOutlet weak var playerDescriptionLabel: UITextView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var playerWageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerSearchBar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text, !searchText.isEmpty else {return}
        SportsDatabaseController.shared.fetchPlayers(searchName: searchText) { (player) in
            guard let player = player else {return}
            DispatchQueue.main.async {
                self.playerNameLabel.text = player.strPlayer
                self.playerSportLabel.text = player.strSport
                self.playerTeamLabel.text = player.strTeam
                if player.strNumber != nil {
                    self.playerNumberLabel.text = player.strNumber
                } else {
                    self.playerNumberLabel.text = "n/a"
                }
                self.playerHeightLabel.text = player.strHeight
                self.playerWeightLabel.text = player.strWeight
                self.playerDescriptionLabel.text = player.strDescriptionEN
                if player.strWage != "" {
                    self.playerWageLabel.text = player.strWage
                } else {
                    self.playerWageLabel.text = "n/a"
                }
                self.playerWageLabel.text = player.strWage
            }
            SportsDatabaseController.shared.fetchPlayerImage(player, completion: { (image) in
                DispatchQueue.main.async {
                    self.playerImageView.image = image
                }
            })
        }
    }
}
