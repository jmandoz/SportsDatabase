//
//  SportsDatabaseController.swift
//  SportsDatabase
//
//  Created by Jason Mandozzi on 6/26/19.
//  Copyright © 2019 Jason Mandozzi. All rights reserved.
//

import UIKit


class SportsDatabaseController {
    
    static let shared = SportsDatabaseController()
    
    let baseURL = URL(string: "https://www.thesportsdb.com/api/v1/json/1/searchplayers.php")
    
    //THE WHOLE POINT OF THE fetchPlayers function IS TO MATCH THIS URL BELOW
    //https://www.thesportsdb.com/api/v1/json/1/searchplayers.php?p=Danny%20Welbeck
    
    func fetchPlayers(searchName: String, completion: @escaping (Player?) -> Void) {
        //Unwrapping the optional baseURL with completion handling of false in case there's an error
        guard let url = baseURL else { completion(nil); return}
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
        //Composed the final URL for us to use
        guard let finalURL = components?.url else {return}
        
        //MARK - dataTask
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            guard let data = data else {
                print("Data was not found")
                completion(nil)
                return
            }
            do {
                let jsDecoder = JSONDecoder()
                let player = try jsDecoder.decode(TopLevelJson.self, from: data)
                completion(player.player.first!)
            } catch {
                print("error decoding: \(error.localizedDescription)")
                completion(nil)
                return
            }
        }; dataTask.resume()
    }
    
    func fetchPlayerImage(_ player: Player, completion: @escaping ((UIImage?) -> Void)) {
        if player.strCutout != nil {
            guard let playerImage = player.strCutout else {return}
            guard let urlForImage = URL(string: playerImage) else {
                print("no URL for Image")
                completion(nil)
                return
            }
            let dataTask = URLSession.shared.dataTask(with: urlForImage) { (data, _, error) in
                if let error = error {
                    print("error getting player image")
                    completion(nil)
                    return
                }
                guard let data = data else {
                    print("data was not found")
                    completion(nil)
                    return
                }
                let image = UIImage(data: data)
                completion(image)
            }
            dataTask.resume()
        } else {
            guard let playerImage = player.strThumb else {return}
            guard let urlForImage = URL(string: playerImage) else {
                print("no URL for Image")
                completion(nil)
                return
            }
            let dataTask = URLSession.shared.dataTask(with: urlForImage) { (data, _, error) in
                if let error = error {
                    print("error getting player image")
                    completion(nil)
                    return
                }
                guard let data = data else {
                    print("data was not found")
                    completion(nil)
                    return
                }
                let image = UIImage(data: data)
                completion(image)
            }
            dataTask.resume()
        }
        
    }
    
}

