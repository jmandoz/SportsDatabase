//
//  SportsDatabase.swift
//  SportsDatabase
//
//  Created by Jason Mandozzi on 6/26/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation

struct Player: Decodable {
    let strName: String
    let strSport: String
    let strTeam: String
    let strNumber: String
    let strHeight: String
    let strWeight: String
    let strDescriptionEN: String
    let strCutout: Image
}
struct Image: Decodable {
    let playerImageURL: String
}
