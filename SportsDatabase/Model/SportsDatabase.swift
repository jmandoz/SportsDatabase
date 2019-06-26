//
//  SportsDatabase.swift
//  SportsDatabase
//
//  Created by Jason Mandozzi on 6/26/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

struct TopLevelJson: Decodable {
    let player: [Player]
}

struct Player: Decodable {
    let strPlayer: String
    let strSport: String
    let strTeam: String
    var strNumber: String?
    let strHeight: String
    let strWeight: String
    let strDescriptionEN: String
    var strCutout: String?
    var strWage: String?
    var strThumb: String?
}

