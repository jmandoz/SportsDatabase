//
//  SportsDatabaseController.swift
//  SportsDatabase
//
//  Created by Jason Mandozzi on 6/26/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import Foundation


class SportsDatabaseController {
    
    static let shared = SportsDatabaseController()
    
    let baseURL = URL(string: "https://www.thesportsdb.com/api/v1/json/1/searchplayers.php")
    
    func fetchPlayers(searchName: String, completion: @escaping (Bool) -> Void) {
        //Unwrapping the optional baseURL with completion handling of false in case there's an error
        guard let url = baseURL else { completion(false); return}
        //Creating our components variable in order and attatching
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
                //Used the print statement below to check if the URL is correct without the player
                //        print(components?.url)
        //Creating the "player search" query that allows us to attach the player part of the URL based on the "key" and "value"
        let playerSearchQuery = URLQueryItem(name: "p", value: searchName)
        //Calling our components constant and attaching out QueryItem that we defined in our above playerSearchQuery constant
        components?.queryItems = [playerSearchQuery]
                //Used this to check if the URL query Item matches the URL we are trying to call
                //        print(components?.url)
    }
    
    //THE WHOLE POINT OF THE fetchPlayers function IS TO MATCH THIS URL BELOW
    //https://www.thesportsdb.com/api/v1/json/1/searchplayers.php?p=Danny%20Welbeck
    
}
